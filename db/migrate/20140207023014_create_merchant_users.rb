class CreateMerchantUsers < ActiveRecord::Migration
  def change
    create_table :merchant_users do |t|

      t.timestamps
    end
  end
end
