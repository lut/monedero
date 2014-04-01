class Card < ActiveRecord::Base
  attr_accessible :name, :category_id, :conditions, :logo_thumbnail, :logo_front, :logo_back

  has_many :user_cards
end
