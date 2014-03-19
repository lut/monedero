class QrcodesController < ApplicationController

  def show
      @user = User.find(current_user.id)
        if @user
                @qr = RQRCode::QRCode.new( 'http://sheltered-chamber-1367.herokuapp.com/profiles/'+@user.id.to_s, :size => 8, :level => :h )

        else
          render file 'public/404', status: 404, formats: [:html]
      end

    end

  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def adminOrMerchant_user
      redirect_to(root_path) unless (current_user.admin? | current_user.isMerchantUser?)
    end

    def signed_in_user
      unless signed_in?
        redirect_to signin_url, notice: "Por favor inicia sesion." 
    end

    

  end


end
