class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @orders = Order.page(params[:page]).per(10)
      @order_details = OrderDetail.all
      @total = @order_details.inject(0){ |sum, order_detail| sum + order_detail.amount }
    else
      @orders = Order.page(params[:page]).per(10)
      @order_details = OrderDetail.all
      @total = @order_details.inject(0){ |sum, order_detail| sum + order_detail.amount }
    end
  end
end
