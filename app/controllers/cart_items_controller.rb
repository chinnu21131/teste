class CartItemsController < ApplicationController
  def create
    if CartItem.exists? menu_item_id: params[:menu_item_id]
      cart_item = CartItem.find(CartItem.find_by(menu_item_id: params[:menu_item_id]).id)
      cart_item.item_quantity = params[:quantity]
      cart_item.save!
    else
      new_cart_item = CartItem.create!(menu_item_id: params[:menu_item_id],
                                       cart_item: params[:menu_item],
                                       cart_item_price: params[:price],
                                       item_quantity: 1)
      menu_id = MenuItem.find(params[:menu_item_id]).menu_id
    end
    redirect_to "/menu##{Menu.find(menu_id).menu_name}"
  end

  def update
    cart_item = CartItem.find(params[:id])
    if params[:state]
      cart_item.item_quantity += 1
      cart_item.save!
    else
      cart_item.item_quantity -= 1
      cart_item.save!

      if cart_item.item_quantity == 0
        CartItem.find(params[:id]).destroy
      end
    end
    menu_item = MenuItem.find(cart_item.menu_item_id)
    redirect_to "/menu/##{Menu.find(menu_item.menu_id).menu_name}"
  end

  def destroy
    CartItem.find(params[:id]).destroy

    redirect_to cart_items_path
  end
end
