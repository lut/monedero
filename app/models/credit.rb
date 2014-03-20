class Credit < ActiveRecord::Base
  attr_accessible :amount, :credit_type, :user_id, :merchant_id, :purchase_amount, :expires_on, :has_expired

  belongs_to :user
  belongs_to :merchant

  validates_presence_of :merchant, :user, :amount


end
