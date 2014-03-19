class AddFoursquareFieldToMerchants < ActiveRecord::Migration
  def up
  	add_column :merchants, :foursquare, :string
  end

  def down
  	remove_column :merchants, :foursquare  	
  end
  
end
