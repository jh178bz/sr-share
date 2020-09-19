class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.paginate(page: params[:page])
  end

  def index
    @search_word = params[:q][:name_cont] if params[:q]
    @q = User.all.ransack(params[:q])
    @users = @q.result(distinct: true).paginate(page: params[:page], per_page: 12)
  end

  def following
    @title = "フォロー"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: 10)
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 10)
    render 'show_follow'
  end

  def favorites
    @title = "お気に入り"
    @user = User.find(params[:id])
    @favorites = @user.favorites.paginate(page: params[:page], per_page: 6)
    render 'show_favorite'
  end
end
