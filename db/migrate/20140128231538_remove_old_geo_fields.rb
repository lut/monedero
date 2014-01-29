class RemoveOldGeoFields < ActiveRecord::Migration
  def changes
  	remove_column(:merchants, :geolat)
  	remove_column(:merchants, :geolon)
  end

end


