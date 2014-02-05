class RollBackMerchantAdmin3 < ActiveRecord::Migration
  def changes
  	remove_column :users, :merchant_name
  	remove_column :users, :merchant_id
  end


end
