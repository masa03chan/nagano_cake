class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).per(10)
    @order_details = OrderDetail.all
    @total = @order_details.inject(0){ |sum, order_detail| sum + order_detail.amount }
  end
end
