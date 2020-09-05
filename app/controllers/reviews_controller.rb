class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.item_id = @item.id
    if @review.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to item_path(@item.id)
    else
      flash.now[:notice] = "投稿に失敗しました"
      render 'new'
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:notice] = "レビューを削除しました"
    redirect_to item_path
  end

  # def confirm_new
  #   @review = current_user.reviews.new(review_params)
  #   render :new unless @review.valid?
  # end

  private

  def review_params
    params.require(:review).permit(:title, :content, :image, :rate, :item_id, :user_id)
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
