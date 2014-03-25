class Credit < ActiveRecord::Base
  attr_accessible :amount, :credit_type, :user_id, :merchant_id, :purchase_amount, :expires_on, :has_expired

  belongs_to :user
  belongs_to :merchant

  validates_presence_of :merchant, :user, :amount

  scope :today, lambda { where("created_at >= :date", :date => Date.today) }							
  scope :current_month, lambda { where("created_at >= ? AND created_at <= ?", Date.today.beginning_of_month, Date.today.end_of_month) }

  scope :positive, lambda { where("amount>?",0)}
  scope :negative, lambda { where("amount<?",0)}

 
end
