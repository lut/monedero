class AddUserInfo < ActiveRecord::Migration
  def up
  	add_column :users, :birthdate, :date
  	add_column :users, :gender, :string
  end

  def down
  	remove_column :users, :birthdate
  	remove_column :users, :gender
  end
end
