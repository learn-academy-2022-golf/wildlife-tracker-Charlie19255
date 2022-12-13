class ChangeDataTypeFromFloatToString < ActiveRecord::Migration[7.0]
  def change
    change_column(:animal_sightings, :longitude, :string)
  end
  def change
      change_column(:animal_sightings, :latitude, :string)
  end
end
