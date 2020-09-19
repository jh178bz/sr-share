class StaticPagesController < ApplicationController
  def home
    @items = Item.all.limit(4)
    @reviews = Review.all.limit(3)
  end

  def about
  end

  def terms
  end
end
