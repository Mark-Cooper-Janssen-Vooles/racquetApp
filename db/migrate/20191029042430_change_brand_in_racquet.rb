class ChangeBrandInRacquet < ActiveRecord::Migration[5.2]
  def change
    change_column :racquets, :brand, :string
  end
end
