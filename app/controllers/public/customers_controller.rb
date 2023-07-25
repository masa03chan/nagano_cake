class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:notice] = "登録情報を更新しました。"
      redirect_to customer_path(current_customer.id)
    else
      render :edit
    end
  end

  def delete_confirm
    @customer = Customer.find(current_customer.id)
  end

  def delete_process
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:email, :encrypted_password, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
  end

end
