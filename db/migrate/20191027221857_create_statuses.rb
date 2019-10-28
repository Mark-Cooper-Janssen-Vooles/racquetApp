class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.boolean :sold
      t.date :date_sold
      t.integer :view_count
      t.references :user, :buyer_user_id, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
