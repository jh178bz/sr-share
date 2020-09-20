class StaticPagesController < ApplicationController
  def home
    @items = Item.paginate(page:params[:page], per_page: 4)
    @reviews = Review.includes(:item).paginate(page:params[:page], per_page: 3)
  end

  def about
  end

  def terms
  end
end
