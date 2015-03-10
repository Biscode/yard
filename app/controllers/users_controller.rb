class UsersController < ApplicationController
   def index
    @user = User.all
  end
#------------------------------------------------

  def show
    @user = User.find(params[:id])
  end
#------------------------------------------------

  def showTask
      @task = Task.find(params[:id])
  end
#------------------------------------------------

  def new
    @user = User.new
  end
#------------------------------------------------

  def create
    @user = User.new(user_parameters)

    if @user.save
      redirect_to(:action => 'index')
      flash[:notice] = "User created successfully"
    else
      render('new')
    end
  end
#------------------------------------------------

  def edit
    @user = User.find(params[:id])
  end
#------------------------------------------------

   def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_parameters)
      redirect_to(:action => 'index')
      flash[:notice] = "User updated successfully"
    else
      render('edit')
    end
  end
#------------------------------------------------

  def delete
    @user = User.find(params[:id])
  end
#------------------------------------------------

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "'#{@user.first_name}' deleted successfully"
    redirect_to(:action =>'index')
  end
#------------------------------------------------

private
def user_parameters
  params.require(:user).permit(:first_name, :last_name, :gender)
end


  end
