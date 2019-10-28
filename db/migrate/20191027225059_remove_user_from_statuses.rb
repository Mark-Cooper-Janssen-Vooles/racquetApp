class RemoveUserFromStatuses < ActiveRecord::Migration[5.2]
  def change
    remove_column :statuses, :user_id
  end
end
