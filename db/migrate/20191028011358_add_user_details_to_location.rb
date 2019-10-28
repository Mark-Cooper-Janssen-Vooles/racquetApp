class AddUserDetailsToLocation < ActiveRecord::Migration[5.2]
  def change
    add_reference :locations, :user_details, foreign_key: true
  end
end
