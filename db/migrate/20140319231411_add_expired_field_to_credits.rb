class AddExpiredFieldToCredits < ActiveRecord::Migration
  def change
  	add_column :credits, :has_expired, :boolean, :default => false
  end
end
