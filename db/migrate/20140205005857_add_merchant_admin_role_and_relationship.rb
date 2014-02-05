class AddMerchantAdminRoleAndRelationship < ActiveRecord::Migration
  def up
 		add_column :users, :merchant_admin, :boolean, :default => false
 		add_column :users, :merchant 
  end

  def down
  end
end
