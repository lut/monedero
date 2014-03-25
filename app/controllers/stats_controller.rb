class StatsController < ApplicationController



  def show

    #Today
    @merchant_credits = Credit.where(:merchant_id => current_user.merchant_id)
    @merchant_todays_credits = @merchant_credits.today.sum(:amount)
    @merchant_todays_sale = @merchant_credits.today.positive.sum(:purchase_amount)
    @merchant_todays_given_credits = @merchant_credits.today.positive.sum(:amount)
    @merchant_todays_charged_credits = @merchant_credits.today.negative.sum(:amount)
    @today_balance = @merchant_todays_given_credits + @merchant_todays_charged_credits

    #Current Month
    @merchant_current_month_credits = @merchant_credits.current_month.sum(:amount)
    @merchant_current_month_sale = @merchant_credits.current_month.positive.sum(:purchase_amount)
    @merchant_current_month_given_credits = @merchant_credits.current_month.positive.sum(:amount)
    @merchant_current_month_charged_credits = @merchant_credits.current_month.negative.sum(:amount)
    @current_month_balance = @merchant_current_month_given_credits + @merchant_current_month_charged_credits
    
    #All Time
    @merchant_total_credits = @merchant_credits.sum(:amount)
    @merchant_sale = @merchant_credits.positive.sum(:purchase_amount)
    @merchant_given_credits = @merchant_credits.positive.sum(:amount)
    @merchant_charged_credits = @merchant_credits.negative.sum(:amount)
    @balance = @merchant_given_credits + @merchant_charged_credits


  end




  
  private
    def adminOrMerchant_user
      redirect_to(root_path) unless (current_user.admin? | current_user.isMerchantUser?)
  
  end
end
