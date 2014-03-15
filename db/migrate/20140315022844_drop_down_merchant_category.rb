class DropDownMerchantCategory < ActiveRecord::Migration
  def up
  	drop_table :MerchantCategory
  end

end
