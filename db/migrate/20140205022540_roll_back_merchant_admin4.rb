class RollBackMerchantAdmin4 < ActiveRecord::Migration
  def up
  	remove_column :users, :merchant_admin
  	remove_column :users, :merchant_id
  end

  def down
  	remove_column :users, :merchant_admin, :boolean
  	remove_column :users, :merchant_id, :integer
  end
end
