class AddMerchantAdminToUsers < ActiveRecord::Migration
  def up
 		add_column :users, :merchant_admin, :boolean, :default => false
 		add_column :users, :merchant_id, :integer
  end

  def down
  end
end