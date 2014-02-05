class RollBackMerchantAdmin < ActiveRecord::Migration
  def up
  end

  def down
  	remove_column(:users, :merchant_admin)
  	remove_column(:users, :id)

  end
end
