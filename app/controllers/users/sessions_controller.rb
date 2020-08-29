# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def new_guest
    @user = User.guest
    sign_in @user
    redirect_to user_path(@user.id)
  end

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
end
