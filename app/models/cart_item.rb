class CartItem < ActiveRecord::Base
  def self.update(id, quantity)
    cart_item = CartItem.find(id)
    cart_item.item_quantity = quantity
    cart_item.save!
  end

  def self.cart_id(item_id)
    CartItem.find_by(menu_item_id: item_id).id
  end
  def self.quantity(item_id)
    CartItem.find_by(menu_item_id: item_id).item_quantity
  end
  def self.amount
    amount = 0
    CartItem.all.each do |cart_item|
      amount += cart_item.cart_item_price * cart_item.item_quantity
    end
    amount
  end
end
