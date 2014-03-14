class CreateRewards < ActiveRecord::Migration
  def up
    create_table :rewards do |t|
    	t.integer :merchant_id
      	t.string :name
      	t.integer :credits

      t.timestamps
    end
  end

  def down
  	drop_table :rewards
  end

end
