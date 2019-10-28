class RemoveUserFromRacquet < ActiveRecord::Migration[5.2]
  def change
    remove_column :racquets, :user_id
  end
end
