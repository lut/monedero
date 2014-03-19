class NewFieldsOnMerchant < ActiveRecord::Migration
  def up
  	add_column :merchants, :address_street, :string
  	add_column :merchants, :address_number, :string
  	add_column :merchants, :address_city, :string
  	add_column :merchants, :address_state, :string
  	add_column :merchants, :address_zip_code, :string
  	add_column :merchants, :address_country, :string
  	add_column :merchants, :logo, :string
  	add_column :merchants, :email, :string
  	add_column :merchants, :facebook, :string
  	add_column :merchants, :website, :string
  	add_column :merchants, :twitter, :string 	
  	add_column :merchants, :instagram, :string

  	remove_column :merchants, :geolat2
  	remove_column :merchants, :geolon2
  end

  def down
  	remove_column :merchants, :address_street
  	remove_column :merchants, :address_number
  	remove_column :merchants, :address_city
  	remove_column :merchants, :address_state
  	remove_column :merchants, :address_zip_code
  	remove_column :merchants, :address_country
  	remove_column :merchants, :logo
  	remove_column :merchants, :email
  	remove_column :merchants, :facebook
  	remove_column :merchants, :website
  	remove_column :merchants, :twitter 	
  	remove_column :merchants, :instagram
  end
end
