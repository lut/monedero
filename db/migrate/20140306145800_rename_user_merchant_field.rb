class RenameUserMerchantField < ActiveRecord::Migration
  def up
  	rename_column :users, :merchant, :isMerchantUser
  end

  def down
  end
end

