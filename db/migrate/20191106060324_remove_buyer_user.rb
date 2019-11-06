class RemoveBuyerUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :statuses, :buyer_user_id_id
    add_reference :statuses, :user, foreign_key: { to_table: 'users' }, null: true
  end
end
