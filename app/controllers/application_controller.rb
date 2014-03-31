class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!


   def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

	def adminOrMerchant_user
	redirect_to(root_path) unless (current_user.admin? | current_user.isMerchantUser?)
	end

end
