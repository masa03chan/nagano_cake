class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    order_details = order.order_details
    order.update(order_params)
    if order.order_status == "payment_confirmation"
      order_details.update_all(making_status: "waiting_for_making")
    end
    redirect_to admins_order_path(order.id)
  end

private
  def order_params
    params.require(:order).permit(:status)
  end
end
