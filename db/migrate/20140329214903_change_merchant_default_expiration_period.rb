class ChangeMerchantDefaultExpirationPeriod < ActiveRecord::Migration
  def change
  	change_column_default :merchants, :days_to_expire, '60'
  end

end
