class UpdateScaleAndPrecisionOnConvertionRate < ActiveRecord::Migration
  def change
  	change_column :merchants, :convertion_rate, :decimal, precision: 2, scale: 2
  	change_column :credits, :convertion_rate, :decimal, precision: 2, scale: 2
  end
end
