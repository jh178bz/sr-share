class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = current_user.passive_notifications.page(params[:page])
    @latest_notifications = @notifications.where(checked: false)
    @old_notifications = @notifications.where.not(id: @latest_notifications.ids)
    @latest_notifications.each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy
    @notification = current_user.passive_notifications.destroy_all
    redirect_to notifications_path
  end
end
