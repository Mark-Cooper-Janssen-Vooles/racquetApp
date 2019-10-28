class RemoveUserDetailsFromLocation < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :user_details_id
    add_reference :locations, :user_detail, foreign_key: true
  end
end
