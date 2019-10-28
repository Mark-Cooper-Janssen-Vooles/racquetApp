class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :state
      t.string :suburb
      t.string :address_line
      t.string :postcode

      t.timestamps
    end
  end
end
