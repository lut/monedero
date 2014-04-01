class Merchant < ActiveRecord::Base
  attr_accessible 	:name, :geolat, :geolon, :phone, :description, :hours, :category_id, 
  					:convertion_rate, :address_street, :address_number, :address_city,
  					:address_state, :address_zip_code, :address_country,
  					:logo, :email, :facebook, :website, :twitter, :instagram, :days_to_expire, 
  					:give_out_birthday_gith, :birthday_gift, :membership_id, :parent_merchant_id

  has_many :credits
  has_many :users
  has_many :awards

  belongs_to :category
  belongs_to :membership

  has_many :stores, :class_name => "Merchant", :foreign_key => "parent_merchant_id"
  belongs_to :chain, :class_name => "Merchant"     

  
end
