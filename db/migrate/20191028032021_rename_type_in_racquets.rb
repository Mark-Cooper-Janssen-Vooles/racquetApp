class RenameTypeInRacquets < ActiveRecord::Migration[5.2]
  def change
    rename_column :racquets, :type, :racquet_type
  end
end
