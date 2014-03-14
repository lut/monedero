class Merchant < ActiveRecord::Base
  attr_accessible :name, :geolat, :geolon, :phone, :description, :hours

  has_many :credits
  has_many :users
  
end
