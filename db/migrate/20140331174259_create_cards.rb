class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.string :name
    	t.string :logo
    	t.string :code_type
    	t.integer :category_id
    	t.text :conditions

      t.timestamps
    end
  end
end
