class CreateRacquets < ActiveRecord::Migration[5.2]
  def change
    create_table :racquets do |t|
      t.references :user, :seller_user_id, foreign_key: { to_table: 'users' }
      t.references :status, foreign_key: true
      t.text :description
      t.string :head_size
      t.string :length
      t.string :strung_weight
      t.string :balance
      t.string :stiffness
      t.string :string_pattern
      t.integer :brand
      t.integer :type

      t.timestamps
    end
  end
end
