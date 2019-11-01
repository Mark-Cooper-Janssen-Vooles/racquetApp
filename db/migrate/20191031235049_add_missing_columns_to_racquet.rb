class AddMissingColumnsToRacquet < ActiveRecord::Migration[5.2]
  def change
    add_column :racquets, :title, :string
    add_column :racquets, :price, :float
  end
end
