class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def self.pl
    OrderItem.create!(order_id: 1, menu_item_id: 1,
                      menu_item_name: "l",
                      quantity: 4)
  end
end
