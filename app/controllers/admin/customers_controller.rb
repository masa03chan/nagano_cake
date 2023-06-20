class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を編集しました。"
      redirect_to admin_customers_path
    else
      render :edit
    end 
  end
  
  private
  
  def customer_params
    params.require(:customer).permit()
  end
  
end
