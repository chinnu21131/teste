class MenuItemsController < ApplicationController
  def new
  end

  def create
    new_menu_item = params[:menu_item]
    price = params[:price]
    menu_id = params[:menu_id]
    MenuItem.create!(menu_item: new_menu_item, description: nil, price: price, menu_id: menu_id)
    redirect_to "/menu/new"
  end

  def create1
    id = params[:menu_no]
    MenuItem.no = id
    redirect_to "/menu_items/new"
  end

  def update
    if params[:edit]
      edit_id = params[:edit]
      MenuItem.edit = edit_id
      redirect_to "/menu/new"
    else
      menuitem = MenuItem.find(params[:id])
      menuitem.menu_item = params[:new_menuitem_name]
      menuitem.price = params[:new_menuitem_price]
      menuitem.menu_id = params[:new_menuitem_menu_id]
      menuitem.save!
      MenuItem.edit = nil
      redirect_to "/menu"
    end
  end

  def destroy
    menuitem = MenuItem.find(params[:delete])
    menuitem.destroy
    redirect_to "/menu"
  end
end
