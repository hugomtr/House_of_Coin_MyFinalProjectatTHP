class AddLongitudeLatitude < ActiveRecord::Migration[5.2]
  def change
    add_column :real_estates, :latitude, :float
    add_column :real_estates, :longitude, :float
  end
end
