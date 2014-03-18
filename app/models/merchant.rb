class Merchant < ActiveRecord::Base
  attr_accessible :name, :geolat, :geolon, :phone, :description, :hours, :category_id, :convertion_rate

  has_many :credits
  has_many :users
  has_many :awards

  belongs_to :category
  
end
