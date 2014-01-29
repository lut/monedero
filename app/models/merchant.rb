class Merchant < ActiveRecord::Base
  attr_accessible :name, :geolat, :geolon
end
