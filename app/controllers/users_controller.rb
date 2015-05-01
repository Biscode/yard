class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
# GET /users
  # GET /users.json
  #if a task id is detected it takes its parameters
  def index
    @users = User.search(params[:search])
<<<<<<< HEAD
    @task = Task.find(params[:id])

    @sprint = Sprint.find(params[:sprint])
    @project = Sprint.find(params[:project]) 

=======
>>>>>>> 6490ef03a2b6ddba183b111123bb9ab5903ca145
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


#it adds the task to the user according to his/her sprint points and then redirects to the project page

  def add_task_to_user
    user_id = params[:user_id]
    task_id = params[:task_id]

    @user = User.find(user_id)
    @task = Task.find(task_id)

<<<<<<< HEAD
    @sp = Sprint.find(params[:sprint]).tsp

    @proid = Project.find(params[:project])
    @spNumber = Sprint.find(params[:sprint])
    @newD = @task.story_points

    @apps = (@sp / 2).floor # @proid.team.users.count

    @dt = @user.dtasks.new({:pid => @proid.id, :snum => @spNumber.id, :story_points => @newD})
    @dt.save

    @dd = @user.dtasks.where(:pid => @proid).where(:snum => @spNumber).sum(:story_points)

    @mytask = @apps - @dd
    if (@mytask >= 0)

    @user.tasks << @task 
  
    flash[:notice] = "Task was added, you now have #{@mytask} point(s) left."
    else
    
    @user.dtasks.where(:pid => @proid).where(:snum => @spNumber).where(:story_points => @newD).destroy_all
      
    flash[:notice] = "Task was not added, you cant exceed your limit."
    end
=======
    @user.tasks << @task
    flash[:notice] = "Task was successfully added"
>>>>>>> 6490ef03a2b6ddba183b111123bb9ab5903ca145

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
