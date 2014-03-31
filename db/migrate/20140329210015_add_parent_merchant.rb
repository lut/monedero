class AddParentMerchant < ActiveRecord::Migration
  def up
  	rename_column :merchants, :months_to_expire, :days_to_expire
  	add_column :merchants, :parent_merchant_id, :integer
  end

  def down
  	remove_column :merchants, :parent_merchant_id
  end

end
