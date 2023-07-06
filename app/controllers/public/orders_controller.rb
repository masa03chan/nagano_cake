class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
  end

  def index
  end

  def show
  end

  def confirm
    
  end
  
  def complete
    
  end
  
  def confirmed
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :customer_id)
  end

end
