class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "配送先を登録しました。"
      redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      flash[:notice] = "配送先情報を更新しました。"
      redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
