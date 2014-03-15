class AddIndexToMerchantName < ActiveRecord::Migration
  def up
  	add_index :merchants, :name
  end
end
