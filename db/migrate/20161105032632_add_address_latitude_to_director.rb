class AddAddressLatitudeToDirector < ActiveRecord::Migration[5.0]
  def change
    add_column :directors, :address_latitude, :float
  end
end
