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
        @credit.expires_on = Date.today + 3.month

      when "remove"
        @credit.amount = -@credit.amount
        
      end
  

      case session[:credit_type]
      when "add"
        respond_to do |format|
          if @credit.save
            format.html { redirect_to profile_path(@credit.user_id), notice: 'Puntos generados exitosamente.' }
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
                format.html { redirect_to profile_path(@credit.user_id), notice: 'Puntos descontados exitosamente.' }
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
