class RenameCreditTypeColumn < ActiveRecord::Migration
  def up
  	rename_column :credits, :type, :credit_type
  end

  def down
  end
end

