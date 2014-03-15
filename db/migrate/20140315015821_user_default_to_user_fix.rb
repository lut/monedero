class UserDefaultToUserFix < ActiveRecord::Migration
  def up
  	change_column_default :users, :role, 'user'
  end

  def down
  	change_column_default :users, :role, nil
  end
end
