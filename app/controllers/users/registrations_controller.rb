# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: :destroy

  def check_guest
    if resouce.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除出来ません'
    end
  end
end
