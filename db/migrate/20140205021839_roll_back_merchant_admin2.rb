class RollBackMerchantAdmin2 < ActiveRecord::Migration
  def changes
  	remove_column(:users, :merchant_admin)
  	remove_column(:users, :id)
  end

end
