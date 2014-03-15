class AddCategoryIdToMerchants < ActiveRecord::Migration
  def up
  	add_column :merchants, :category_id, :integer
  	add_index :merchants, :category_id
  end

  def down
  	remove_column :merchants, :category_id
  end

end
