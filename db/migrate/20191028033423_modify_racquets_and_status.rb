class ModifyRacquetsAndStatus < ActiveRecord::Migration[5.2]
  def change
    remove_column :racquets, :status_id
    add_reference :statuses, :racquet, foreign_key: true
  end
end
