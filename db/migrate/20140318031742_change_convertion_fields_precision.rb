class ChangeConvertionFieldsPrecision < ActiveRecord::Migration
  def change
  	change_column :credits, :convertion_rate, :precision => 1
  	change_column :merchants, :convertion_rate, :precision => 1
  end

end
