class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!


  def index
    @cart_items = CartItem.all
    @total = @cart_items.inject(0){ |sum, cart_item| sum + cart_item.subtotal } 
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = params[:item_id]
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      flash[:notice] = "商品をカートに入れました。"
      redirect_to cart_items_path
    elsif @cart_item.save
      flash[:notice] = "商品をカートに入れました。"
      redirect_to cart_items_path
    else
      flash[:alert] = "個数を選択してください"
      @items = Item.all
      render :index
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.customer_id = current_customer.id
    if cart_item.update(cart_item_params)
      flash[:notice] = "個数を更新しました。"
      redirect_to cart_items_path
    else
      flash[:alert] = "個数を選択してください。"
      @cart_items = CartItem.all
      render :index
    end
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました。"
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    flash[:notice] = "#{cart_item.item.name}を削除しました。"
    redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
