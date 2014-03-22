class Mensajero < ActionMailer::Base
  def email_name
    mail :subject => "Mandrill rides the Rails!",
         :to      => "lutgardo21@gmail.com",
         :from    => "lutgardo21@gmail.com"
  end
end