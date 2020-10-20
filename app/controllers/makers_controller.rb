class MakersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:new, :create, :destroy]

  def index
    @makers = Maker.paginate(page: params[:page], per_page: 8)
  end

  def show
    @maker = Maker.find(params[:id])
    @items = @maker.items.page(params[:page])
  end

  def new
    @maker = Maker.new
    @makers = Maker.all
  end

  def create
    @maker = Maker.new(maker_params)
    if @maker.save
      flash[:notice] = "作成しました"
      redirect_to new_item_path
    else
      flash.now[:notice] = "作成に失敗しました"
      render 'new'
    end
  end

  def destroy
    Maker.find(params[:id]).destroy
    flash[:notice] = "削除しました"
    redirect_to new_maker_path
  end

  private

  def maker_params
    params.require(:maker).permit(:id, :name, :image)
  end
end
