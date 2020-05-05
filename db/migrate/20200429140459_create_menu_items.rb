class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :menu_item
      t.string :description
      t.integer :price
      t.bigint :menu_id
    end
  end
end
