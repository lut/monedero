class ProfilesController < ApplicationController
  	before_filter :adminOrMerchant_user, only: :index

	def index
	    @user = User.all

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @users }
	    end
  	end



	def show
    	@user = User.find(params[:id])
    		if @user
    			@credits = @user.credits.all
    			@qr = RQRCode::QRCode.new( 'http://sheltered-chamber-1367.herokuapp.com/profiles/'+@user.id.to_s, :size => 4, :level => :h )

    			render action: :show
    		else
    			render file 'public/404', status: 404, formats: [:html]
			end
    end

    def qrcode
    	@user = User.find(params[:id])
    		if @user
                @qr = RQRCode::QRCode.new( 'http://sheltered-chamber-1367.herokuapp.com/profiles/'+@user.id.to_s, :size => 4, :level => :h )

    		else
    			render file 'public/404', status: 404, formats: [:html]
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
