class AddMerchantContactInfo < ActiveRecord::Migration
  def up
  	add_column :merchants, :phone, :integer
  	add_column :merchants, :description, :text
  	add_column :merchants, :hours, :string
  end

  def down
  	remove_column :merchants, :phone
  	remove_column :merchants, :description
  	remove_column :merchants, :hours
  end
end
