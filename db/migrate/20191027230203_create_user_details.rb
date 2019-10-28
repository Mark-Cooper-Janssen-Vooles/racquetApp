class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true
      t.integer :type

      t.timestamps
    end
  end
end
