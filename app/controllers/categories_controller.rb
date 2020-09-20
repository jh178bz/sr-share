class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:new, :create, :destroy]

  def index
    @categories = Category.paginate(page:params[:page], per_page: 4)
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items.page(params[:page])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "作成しました"
      redirect_to new_item_path
    else
      flash.now[:notice] = "作成に失敗しました"
      render 'new'
    end
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def destory
    Category.find(params[:id]).destroy
    flash[:notice] = "削除しました"
    redirect_to new_category_path
  end

  private

  def category_params
    params.require(:category).permit(:id, :name, :image)
  end
end
