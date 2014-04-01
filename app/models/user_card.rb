class UserCard < ActiveRecord::Base
  attr_accessible :card_number, :card_id, :user_id

  belongs_to :card
  belongs_to :user

  validates_presence_of :card, :user, :card_number


end
