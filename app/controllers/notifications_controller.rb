class NotificationsController < ApplicationController
  def index
    ## Ahmed Saleh
    ## this line gets all the activities that we done to the current_user logged in
    ## and shows them to that user ordered Descendingly
    @notifications = PublicActivity::Activity.order("created_at desc").where(trackable_id: current_user)
  end
end
