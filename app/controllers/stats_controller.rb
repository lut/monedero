class StatsController < ApplicationController
    before_filter :adminOrMerchant_user


  def show
      

    end

  


  private

    def adminOrMerchant_user
      redirect_to(root_path) unless (current_user.admin? | current_user.isMerchantUser?)
    end

  end


end