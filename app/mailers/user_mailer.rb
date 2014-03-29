class UserMailer < ActionMailer::Base
  default from: "notification@example.com"

  def welcome_email(user)
	@user = user
	@url = 'http://volveras.mx'
	mail(to: @user.email, subject: 'Welcome to My Awesome Site')  	
  end

  def new_credit_email(user)
	@user = user
	@url = 'http://volveras.mx'
	mail(to: @user.email, subject: 'Nuevos puntos!')  	
  end

end

