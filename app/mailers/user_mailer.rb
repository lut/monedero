class UserMailer < ActionMailer::Base
  default from: "hola@volveras.mx"

  def welcome_email(user)
	@user = user
	mail(to: @user.email, subject: 'Bienvenido a Volveras <%= @user.first_name %>')  	
  end

  def new_credit_email(credit)
  @credit = credit
	@user = User.find(@credit.user_id)
	@merchant = Merchant.find(@credit.merchant_id)
	mail(to: @user.email, subject: 'Nuevos puntos!')  	
  end

  def credits_expiring_soon(user, credits_per_merchant)
  @user = User.find(user)
  @credits_per_merchant = credits_per_merchant
  mail(to: @user.email, subject: 'Tienes puntos que estan por caducar!')    
  end

  def birthday_gift_email(user, credits_per_merchant)
  @user = User.find(user)
  @credits_per_merchant = credits_per_merchant
  mail(to: @user.email, subject: 'Feliz Cumpleanos <%= @user.first_name %>! Tenemos una sopresa para ti...')    
  end


end

