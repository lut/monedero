class AddMerchantAndUserIdToMerchantUsersTable < ActiveRecord::Migration
 def up
 	add_column :merchant_users, :merchant_id, :integer
 	add_column :merchant_users, :user_id, :integer
  end

  def down
  end
end