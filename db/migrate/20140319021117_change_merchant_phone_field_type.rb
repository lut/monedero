class ChangeMerchantPhoneFieldType < ActiveRecord::Migration
  def change
  	change_column :merchants, :phone, :string
  end

end
