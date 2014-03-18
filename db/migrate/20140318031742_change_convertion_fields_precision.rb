class ChangeConvertionFieldsPrecision < ActiveRecord::Migration
  def change
  	change_column :credits, :convertion_rate, :decimal, precision: 1, scale: 2
  	change_column :merchants, :convertion_rate, :decimal, precision: 1, scale: 2
  end

end
