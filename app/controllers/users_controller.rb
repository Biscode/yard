class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
# GET /users
  # GET /users.json
  #if a task id is detected it takes its parameters
  def index
    @users = User.search(params[:search])
  end

  # GET /users/1
  # GET /users/1.json


# GET /users/new
  def edit
  end


#to make a new user

def search
end


def new
  @user = User.new
  end
# create a user based on specefic params
  def create
     @user = User.new(user_params)
    if @user.save
        redirect_to root_url, :notice => "Signed up!"
    else
         render "new"
    end
  end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @users = User.search params[:search]
  end

#it add the task to the user and then redirects to the project page
  def add_task_to_user
    user_id = params[:user_id]
    task_id = params[:task_id]

    @user = User.find(user_id)
    @task = Task.find(task_id)

    @user.tasks << @task
    flash[:notice] = "Task was successfully added"

    redirect_to(:controller => 'projects', :action => 'index')
  end

  def add_user_to_team
    team_id = params[:team_id]
    user_id = params[:id]

    @team = Team.find(team_id)
    @user = User.find(user_id)

    @team.users << @user

    ## Ahmed Saleh
    ## Here we create an activity/notification everytime a user is added to a team
    ## and we set a special parameter :subject_id to team_id
    @user.create_activity :create, owner: current_user, parameters: {subject_id: team_id}

    redirect_to :back
  end



  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
      @user = User.find(params[:id])
   end
    # Never trust parameters from the scary internet, only allow the white list through.
   def user_params
      params.require(:user).permit(:email)
   end
  def user_params
      params.require(:user).permit( :email, :password, :password_confirmation)
  end
end
