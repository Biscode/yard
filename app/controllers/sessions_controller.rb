class SessionsController < ApplicationController
#just make new session
def new
end
#create metod which handle authentication
def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
        render 'projects/new'
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end
#uses for logout 
def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
end
end
