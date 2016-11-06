class AddAddressLongitudeToDirector < ActiveRecord::Migration[5.0]
  def change
    add_column :directors, :address_longitude, :float
  end
end
