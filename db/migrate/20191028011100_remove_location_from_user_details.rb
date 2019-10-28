class RemoveLocationFromUserDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_details, :location_id
  end
end
