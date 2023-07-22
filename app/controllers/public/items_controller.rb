class Public::ItemsController < ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.where(is_active: true).page(params[:page]).per(8)
      @genres = Genre.all
      @quantity = @genre.items.where(is_active: true).count
    elsif params[:item_name]
      @items = Item.where(is_active: true).page(params[:page]).per(8)
      @genres = Genre.all
      @quantity = Item.where(is_active: true).count
    else
      @items = Item.where(is_active: true).page(params[:page]).per(8)
      @genres = Genre.all
      @quantity = Item.count
    end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

end
