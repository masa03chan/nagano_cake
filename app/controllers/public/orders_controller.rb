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
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order = Order.new
    else  
      redirect_to new_orders_path
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
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
