class AddMerchantIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :merchant_id, :integer
  end

  def self.down
    remove_column :users, :merchant_id
  end
end
