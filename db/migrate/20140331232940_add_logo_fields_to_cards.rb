class AddLogoFieldsToCards < ActiveRecord::Migration
  def change
  	rename_column :cards, :logo, :logo_thumbnail
  	add_column :cards, :logo_front, :string
  	add_column :cards, :logo_back, :string
  end
end
