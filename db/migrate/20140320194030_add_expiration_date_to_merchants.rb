class AddExpirationDateToMerchants < ActiveRecord::Migration
  def up
  	add_column :merchants, :months_to_expire, :integer, :default => '3'
  end

  def down
  	remove_column :merchants, :months_to_expire
  end
end
