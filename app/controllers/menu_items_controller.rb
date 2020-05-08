class MenuItemsController < ApplicationController
  def index
    edit_id = params[:edit]
    @menu_item = MenuItem.find(edit_id)
  end

  def show
    edit_id = params[:edit]
    @menu_item = MenuItem.find(edit_id)
  end

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
    menuitem = MenuItem.find(params[:id])
    menuitem.menu_item = params[:new_menuitem_name]
    menuitem.price = params[:new_menuitem_price]
    menuitem.menu_id = params[:new_menuitem_menu_id]
    menuitem.save!
    redirect_to "/menu/new?menu_id=#{menuitem.menu_id}"
  end

  def destroy
    menuitem = MenuItem.find(params[:delete])
    menuitem.destroy
    redirect_to "/menu/new?menu_id=#{menuitem.menu_id}"
  end
end
