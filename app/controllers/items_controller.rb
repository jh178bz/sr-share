class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  before_action :admin_user, only: [:new, :create, :destroy]

  def index
    @search_word = params[:q][:name_cont] if params[:q]
    @q = Item.all.ransack(params[:q])
    @items = @q.result(distinct: true).paginate(page: params[:page], per_page: 8)
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews.paginate(page: params[:page])
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
    Item.find(params[:id]).destroy
    flash[:notice] = "削除しました"
    redirect_to new_item_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :content, maker_ids: [], category_ids: [])
  end
end
