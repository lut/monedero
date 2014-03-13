class AddLatAndLngToMerchants < ActiveRecord::Migration
   def change
    add_column :merchants, :lat, :numeric
    add_column :merchants, :lng, :numeric
  end

  def self.down
    remove_column :merchants, :lat
    remove_column :merchants, :lng
  end
end
