class Merchant < ActiveRecord::Base
  attr_accessible :name, :geolat, :geolon

  has_many :credits
end
