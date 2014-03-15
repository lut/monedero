class MerchantCategory < ActiveRecord::Migration
  def change
  	create_table :MerchantCategory do |t|
  		t.string :name
  		t.string :icon
  	end
  end
  
end
