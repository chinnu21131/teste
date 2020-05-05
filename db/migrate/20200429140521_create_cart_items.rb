class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.bigint :user_id
      t.bigint :menu_item_id
      t.string :cart_item
      t.integer :cart_item_price
      t.integer :item_quantity
    end
  end
end
