class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    current_user.favorite(@item)
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    current_user.favorites.find_by(item_id: @item.id).destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
