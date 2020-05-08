class OrderController < ApplicationController
  def create
    new_order = Order.create!(user_id: 1,
                              order_date: Date.today,
                              amount: 30)
    OrderItem.active_order_items(new_order.id)
    redirect_to "/order"
  end

  def date
  end

  def date_display
    @start = params[:start_date]
    @end = params[:end_date]
  end
end
