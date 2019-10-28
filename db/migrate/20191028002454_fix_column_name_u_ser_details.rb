class FixColumnNameUSerDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_details, :type, :user_type
  end
end
