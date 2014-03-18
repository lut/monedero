class AddFieldsToCreditTable < ActiveRecord::Migration
  def up
  	add_column :credits, :purchase_amount, :integer, scale: 2
  	add_column :credits, :convertion_rate, :decimal, precision: 2, scale: 2
  	add_column :credits, :expires_on, :date
  end

  def down
  	remove_column :credits, :purchase_amount
  	remove_column :credits, :convertion_rate
  	remove_column :credits, :expires_on
  end

end
