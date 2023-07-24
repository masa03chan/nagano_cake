class Public::ItemsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def search
    @results = @q.result
  end

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.where(is_active: true).page(params[:page]).per(8)
      @genres = Genre.all
      @quantity = @genre.items.where(is_active: true).count
    elsif params[:q]
      @results = @q.result
      @items = @q.result.where(is_active: true).page(params[:page]).per(8)
      @genres = Genre.all
      @quantity = @q.result.where(is_active: true).count
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

private

  def set_q
    @q = Item.ransack(params[:q])
  end

end
