class ModifyRacquetsAgain < ActiveRecord::Migration[5.2]
    def change
      remove_column :racquets, :seller_user_id_id
      add_reference :racquets, :seller_user, foreign_key: { to_table: 'users' }
    end
end
