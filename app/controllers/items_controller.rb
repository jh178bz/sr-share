class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "作成しました"
      redirect_to @item
    else
      flash.now[:notice] = "作成に失敗しました"
      render 'new'
    end
  end

  def destroy
  end

  private

    def item_params
      params.require(:item).permit(:name, :image, :content, maker_ids: [], category_ids: [])
    end
end
