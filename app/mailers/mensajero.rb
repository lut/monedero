class Mensajero < ActionMailer::Base
  def email_name
    mail :subject => "Mandrill rides the Rails!",
         :to      => "lutgardo21@gmail.com",
         :from    => "lutgardo21@gmail.com"
  end

  def credits_expiring_soon
    mail :subject => "Tienes puntos que están por caducar!",
         :to      => "lutgardo21@gmail.com",
         :from    => "lutgardo21@gmail.com"
         :message =>

         
  end

end