class MenuController < ApplicationController
  def new
    @id = params[:menu_edit_id]
    @m_id = params[:menuitem_edit_id]
  end

  def index
  end

  def create
    new_menu = Menu.create!(menu_name: params[:menu_name])
    redirect_to "/menu/new"
  end

  def update
    if params[:edit]
      edit_id = params[:edit]
      Menu.edit = edit_id
      redirect_to "/menu/new"
    else
      menu = Menu.find(params[:id])
      menu.menu_name = params[:new_menu_name]
      menu.save!
      Menu.edit = nil
      redirect_to "/menu"
    end
  end

  def destroy
    menuitems = MenuItem.all.where(menu_id: params[:delete])
    menu = Menu.find(params[:delete])
    menuitems.destroy_all
    menu.destroy
    redirect_to "/menu"
  end
end
