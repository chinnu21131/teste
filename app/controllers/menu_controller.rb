class MenuController < ApplicationController
  def new
    @id = params[:menu_id]
    @m_id = params[:menuitem_edit_id]
  end

  def index
  end

  def show
    edit_id = params[:id]
    @menu = Menu.find(edit_id)
  end

  def create
    new_menu = Menu.create!(menu_name: params[:menu_name])
    redirect_to "/menu/new"
  end

  def update
    menu = Menu.find(params[:id])
    menu.menu_name = params[:new_menu_name]
    menu.save!
    redirect_to "/menu/new?menu_id=#{menu.id}"
  end

  def destroy
    menuitems = MenuItem.all.where(menu_id: params[:id])
    menu = Menu.find(params[:id])
    menuitems.destroy_all
    menu.destroy
    redirect_to "/menu/new"
  end
end
