class AddConvertionRateToMerchant < ActiveRecord::Migration
  def up
  	add_column :merchants, :convertion_rate, :decimal, precision: 2, scale: 2
  end

  def down
  	remove_column :merchants, :convertion_rate
  end
end
