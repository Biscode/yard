class NotificationsController < ApplicationController
  def index
    @notifications = PublicActivity::Activity.order("created_at desc").where(trackable_id: current_user)
  end
end
