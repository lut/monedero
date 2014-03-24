class MailsController < ApplicationController
    before_filter :admin_user

    def send_email
        Mensajero.email_name.deliver
    end

    def self.credits_expiring_soon

        @credits_expiring_soon = Credit.where(:has_expired => false, :expires_on => Date.today)
        @users_with_credits_expiring_soon = @credits_expiring_soon.group(:user_id)

        @users_with_credits_expiring_soon.each do |user|

            @credits_per_merchant_expiring_soon = Credit.where(:has_expired => false, :expires_on => Date.today, :user_id => user.user_id).group(:merchant_id).sum(:amount)
            @credits_per_merchant = Credit.where(:user_id => user.user_id).group(:merchant_id).sum(:amount)

            Mensajero.email_name.deliver

        end  
    end

end
