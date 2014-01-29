class CreateCredits < ActiveRecord::Migration
  def change
  	add_column :credits, :type, :string
  end
end
