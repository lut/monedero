class PrintsController < ApplicationController

  def all



  end




  
  private
    def adminOrMerchant_user
      redirect_to(root_path) unless (current_user.admin? | current_user.isMerchantUser?)
  
  end
end
