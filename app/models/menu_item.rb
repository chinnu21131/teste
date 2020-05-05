class MenuItem < ActiveRecord::Base
  belongs_to :menu
  class << self; attr_accessor :no, :edit end
  @no = nil
  @edit = nil

  def self.menu_items(id)
    MenuItem.where(menu_id: id)
  end

  def self.active_menus
    menus = Array.new
    Menu.all.each do |menu|
      if menu.id != no
        menus.push(menu)
      end
    end
    menus
  end
end
