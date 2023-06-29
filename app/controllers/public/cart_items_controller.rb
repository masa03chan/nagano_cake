class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    @item = Item.find(cart_item_params[:item_id])
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      flash[:notice] = "商品をカートに入れました。"
      redirect_to cart_items_path
    else
      @items = Item.all
      render :index
    end
  end

  def update
  end

  def destroy
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
