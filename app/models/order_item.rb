class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item
  def self.active_order_items(order_no)
    CartItem.all.each do |cart_item|
      OrderItem.create!(order_id: order_no, menu_item_id: cart_item.menu_item_id,
                        menu_item_name: cart_item.cart_menu_item,
                        quantity: cart_item.item_quantity)
    end
    CartItem.destroy_all
  end
end
