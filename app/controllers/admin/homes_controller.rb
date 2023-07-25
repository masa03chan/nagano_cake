class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @orders = Order.page(params[:page]).per(10)
    else
      @orders = Order.page(params[:page]).per(10)
    end
  end
end
