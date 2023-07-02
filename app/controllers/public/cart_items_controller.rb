class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!


  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = params[:item_id]
    if @cart_item.save!
      flash[:notice] = "商品をカートに入れました。"
      redirect_to cart_items_path
    else
      flash[:alert] = "個数を選択してください"
      @items = Item.all
      render :index
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = params[:item_id]
    if @cart_item.update(cart_item_params)
      flash[:notice] = "個数を更新しました。"
      redirect_to cart_items_path
    else
      flash[:alert] = "個数を選択してください。"
      @cart_items = CartItem.all
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    cartittem.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
