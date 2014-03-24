class StatsController < ApplicationController
    before_filter :adminOrMerchant_user


  def show
      
      @credits_given_today = Credit.where(:merchant_id => current_user.merchant_id, :amount > 0, cre )

    end

  


  private

    def adminOrMerchant_user
      redirect_to(root_path) unless (current_user.admin? | current_user.isMerchantUser?)
    end

  end


end