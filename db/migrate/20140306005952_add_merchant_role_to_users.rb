class AddMerchantRoleToUsers < ActiveRecord::Migration
 def change
    add_column :users, :merchant, :boolean, :default => false
  end

  def self.down
    remove_column :users, :merchant
  end
end
