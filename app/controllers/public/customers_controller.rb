class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
    
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update
      flash[:notice] = "登録情報を更新しました。"
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end
  
  def delete_confirm
    
  end
  
  def delete_process
    @customer = Customer.find_by(email: params[:customer][:email])
    @customer.update(is_valid: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to public_root_path
  end
    
  
  private

  def customer_params
    params.require(:customer).permit(:email, :encrypted_password, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
  end
  
end
