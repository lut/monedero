class User < ActiveRecord::Base
  after_create :send_welcome_email 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  					:first_name, :last_name, :profile_name, :admin, :isMerchantUser, :merchant_id, :role, :birthdate, :gender
            
  # attr_accessible :title, :body
  has_many :credits
  belongs_to :merchant

  def  full_name
  	first_name + " " + last_name
  end


    def send_welcome_email
      UserMailer.welcome_email(self).deliver
    end

end
