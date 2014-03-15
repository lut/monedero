class UserDefaultToUser < ActiveRecord::Migration
  def up
  	change_column_default :users, :role, 'admin'
  end

  def down
  	  change_column_default :users, :role, nil
  end
end
