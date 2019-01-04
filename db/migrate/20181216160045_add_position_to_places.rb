class AddPositionToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :latitude, :decimal
    add_column :places, :longitude, :decimal
  end
end
