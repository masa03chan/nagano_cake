class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
    
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update
    redirect_to 
  end
  
  
end
