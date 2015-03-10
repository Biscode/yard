class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end
#------------------------------------------------

  def create
    @task = Task.new(task_params)

    if @task.title.blank?
      flash[:notice] = "You must enter a title"
      render('new')
    else
      @task.save
      redirect_to(:controller => 'tasks', :action => 'index')
      flash[:notice] = "task created successfully"
    end
  end
#------------------------------------------------

  def edit
    @task = Task.find(params[:id])
  end
#------------------------------------------------

  def update
    @task = Task.find(params[:id])

     if @task.update_attributes(task_params)
      redirect_to(:action => 'index')
      flash[:notice] = "task updated successfully"
    else
      render('edit')
    end
  end
#------------------------------------------------

  def delete
    @task = Task.find(params[:id])
  end
#------------------------------------------------

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "'#{@task.title}' deleted successfully"
    redirect_to(:action =>'index')
  end
#------------------------------------------------

private

def task_params
  params.require(:task).permit(:title, :description, :status, :deadline, :priority)
end

end
