class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
    	t.string :name
    	t.integer :price

      	t.timestamps
    end

    add_column :merchants, :membership_id, :integer
    add_column :merchants, :give_out_birthday_gith, :boolean, :default => false
    add_column :merchants, :birthday_gift, :integer

    add_index :memberships, :name
    add_index :users, :first_name

  end
end
