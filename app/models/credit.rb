class Credit < ActiveRecord::Base
  attr_accessible :amount, :credit_type, :user_id, :merchant_id

  belongs_to :user
  belongs_to :merchant

end
