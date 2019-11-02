class AddCoordinatesToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :latitude, :decimal
    add_column :locations, :longitude, :decimal
  end
end
