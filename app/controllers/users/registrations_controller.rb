# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :check_guest, only: :destroy

  def check_guest
    if resouce.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除出来ません'
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :remove_image, :image_cache])
  end

  def after_update_path_for(resource)
    user_path(current_user.id)
  end
end
