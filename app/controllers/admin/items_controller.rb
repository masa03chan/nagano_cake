class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新しい商品を登録しました。"
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :genre_id, :is_active)
  end

end
