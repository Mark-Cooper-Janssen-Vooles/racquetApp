class DropShoppingCartTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :shopping_carts
  end
end
