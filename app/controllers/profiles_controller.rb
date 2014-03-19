class ProfilesController < ApplicationController
  	before_filter :adminOrMerchant_user, only: :index

	def index
        if current_user.try(:isMerchantUser?)   
            @user = Credit.where( :merchant_id => current_user.merchant_id).group(:user_id).sum(:amount)
        else
	       @user = User.all
        end

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @users }
	    end
  	end



	def show
    	@user = User.find(params[:id])
    		if @user
                       
                case current_user.role
                    when "admin"
                        @credits = Credit.where(:user_id => @user.id)

                    when "merchantUser"
                        @credits = Credit.where(:user_id => @user.id, :merchant_id => current_user.merchant_id)
                        @total_credit = Credit.where(:user_id => @user.id, :merchant_id => current_user.merchant_id).sum(:amount)


                    when "user"
                        @user = User.find(current_user.id)
                        @credits = Credit.where(:user_id => @current_user.id)
                        @credits_count = Credit.where(:user_id => @current_user.id).count
                        @credit_per_merchant = Credit.where(:user_id => @current_user.id).group(:merchant_id).sum(:amount)
                end
 
    			render action: :show
    		else
    			render file 'public/404', formats: [:html]
			end
    end

    def qrcode
    	@user = User.find(params[:id])
    		if @user
                @qr = RQRCode::QRCode.new( 'http://sheltered-chamber-1367.herokuapp.com/qrcode/'+@user.id.to_s, :size => 8, :level => :h )

    		else
    			render file 'public/404', status: 404, formats: [:html]
			end

    end

    def faqs
        render file 'public/faqs', formats: [:html]
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
