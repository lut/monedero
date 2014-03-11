class DropMerchantUsersAndStatuses < ActiveRecord::Migration
  def up
  	drop_table :merchant_users
  	drop_table :statuses
  end

  def down
  end
end
