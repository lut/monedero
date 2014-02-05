class AddAssignedByToCredit < ActiveRecord::Migration
  def change
  	add_column :credits, :assigned_by, :text
  end
end
