class CreditsController < ApplicationController
  before_filter :adminOrMerchant_user, only: [:new, :edit, :create, :update, :destroy, :index, :show]

  def index
    if current_user.try(:admin?)
      @credits = Credit.all
      else
        @credits = Credit.find(:all,:conditions=>{:merchant_id => current_user.merchant_id(&:merchant_id)})
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @credits }
    end
  end

  def all
    @merchant = Merchant.find(params[:id])
    @credits = Credit.where(:user_id => current_user.id, :merchant_id => @merchant.id)
    @credits_sum = Credit.where(:user_id => current_user.id, :merchant_id => @merchant.id).sum(:amount) 

  end

  # GET /credits/1
  # GET /credits/1.json
  def show
    @credit = Credit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @credit }
    end
  end

  # GET /credits/new
  # GET /credits/new.json
  def new
    @credit = Credit.new
    @credit.user_id = params[:id]
    session[:credit_type] = params[:type]
    @total_credit = Credit.where(:user_id => @credit.user_id, :merchant_id => current_user.merchant_id).sum(:amount)



    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @credit }
    end
  end

  # GET /credits/1/edit
  def edit
    @credit = Credit.find(params[:id])
  end

  # POST /credits
  # POST /credits.json
  def create


    @credit = Credit.new(params[:credit])
    @credit.assigned_by = current_user.email


    if current_user.try(:admin?) 
        else
        @credit.merchant_id = current_user.merchant_id
      end

    @total_credit = Credit.where(:user_id => @credit.user_id, :merchant_id => @credit.merchant_id).sum(:amount)


      case session[:credit_type]
      when "add"
        @credit.convertion_rate = Merchant.find(@credit.merchant_id).convertion_rate
        @credit.amount = @credit.purchase_amount * @credit.convertion_rate
        @credit.expires_on = Date.today + Merchant.find(@credit.merchant_id).months_to_expire.month


      when "remove"
        @credit.amount = -@credit.amount
        
      end
  

      case session[:credit_type]
      when "add"
        respond_to do |format|
          if @credit.save

            UserMailer.new_credit_email(@credit).deliver

            format.html { redirect_to profile_path(@credit.user_id), notice: 'Puntos generados exitosamente. Se envio un mail de confirmacion al usuario.' }
            format.json { render json: @credit, status: :created, location: @credit }
          else
            format.html { render action: "new" }
            format.json { render json: @credit.errors, status: :unprocessable_entity }
          end
        end

      when "remove"
          if @credit.amount.abs <= @total_credit
            respond_to do |format|
              if @credit.save
                format.html { redirect_to profile_path(@credit.user_id), notice: 'Puntos descontados exitosamente. Se envio un mail de confirmacion al usuario.' }
                format.json { render json: @credit, status: :created, location: @credit }
              else
                format.html { render action: "new" }
                format.json { render json: @credit.errors, status: :unprocessable_entity }
              end
            end
          
          else
            respond_to do |format|
                format.html { redirect_to profile_path(@credit.user_id), notice: 'El saldo de puntos no es suficiente.' }
                format.json { render json: @credit, status: :created, location: @credit }
              end
          end         
      end
  end



  # PUT /credits/1
  # PUT /credits/1.json
  def update
    @credit = Credit.find(params[:id])

    respond_to do |format|
      if @credit.update_attributes(params[:credit])
        format.html { redirect_to @credit, notice: 'Credito actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credits/1
  # DELETE /credits/1.json
  def destroy
    @credit = Credit.find(params[:id])
    @credit.destroy

    respond_to do |format|
      format.html { redirect_to credits_url }
      format.json { head :no_content }
    end
  end

  def self.create_expired_lines

    @expired_credit = Credit.where(:expires_on => Date.today, :has_expired => false)

    @expired_credit.each do |credit|

      @user_outcome = Credit.where(:user_id => credit.user_id, :merchant_id => credit.merchant_id).where("amount<?",0).sum(:amount).abs
      @user_total_expired = Credit.where(:user_id => credit.user_id, :merchant_id => credit.merchant_id, :has_expired => true).sum(:amount)

      @user_available = (@user_outcome - @user_total_expired).abs

      @credit_to_deduct = credit.amount - @user_available

      if @credit_to_deduct > 0

        @new_credit = Credit.new
        @new_credit.amount =  -(@credit_to_deduct)               
        @new_credit.user_id =     credit.user_id
        @new_credit.merchant_id = credit.merchant_id
        @new_credit.credit_type = "expirationBalance"
        @new_credit.assigned_by = "admin"

        @new_credit.save

      end

      credit.has_expired = true
      credit.save

    end  
  end

  def self.credits_expiring_soon

    @users_with_credits_expiring_soon = Credit.expiring_next_7_days.group(:user_id).pluck(:user_id)

    @users_with_credits_expiring_soon.each do |user|

      @credits_per_merchant_expiring_soon = Credit.expiring_next_7_days.where(:user_id => user).group(:merchant_id).sum(:amount)

      UserMailer.credits_expiring_soon(user, @credits_per_merchant_expiring_soon).deliver

    end

  end

  def self.create_birthday_gifts

    @users = User.where(birthdate: Date.today).pluck(:id)


    @users.each do |user|

      @merchants = Merchant.where(give_out_birthday_gith: true).where("birthday_gift is NOT NULL").select([:id, :birthday_gift])

      @merchants.each do |merchant,gift|

        @new_credit =             Credit.new
        @new_credit.amount =      gift         
        @new_credit.user_id =     user
        @new_credit.merchant_id = merchant   
        @new_credit.credit_type = "BirthdayGift"
        @new_credit.assigned_by = "admin"
        @new_credit.expires_on = Merchant.find(merchant).months_to_expire

        @new_credit.save

      end

      @credits_per_merchant = Credit.today.where(:credit_type => "BirthdayGift",:user_id => user).select([:merchant_id, :amount])
      UserMailer.birthday_gift_email(user, @credits_per_merchant).deliver

    end


  end





  private
    def adminOrMerchant_user
      redirect_to(root_path) unless (current_user.admin? | current_user.isMerchantUser?)
    end

    def signed_in_user
      unless signed_in?
        redirect_to signin_url, notice: "Por favor inicia sesion." 
    end

  end

end
