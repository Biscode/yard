class tasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    if params[:category]
     @tasks = task.where(category: params[:category]).order("created_at DESC")
    else
     @tasks = task.all
    end
  end

  # GET /task/1
  # GET /task/1.json
  def show
  end

  # GET /tasks/new
  def new
    @tasks = tasks.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # TASK /tasks
  # TASK /tasks.json
  def create
    @user = current_user
    @task = @user.tasks.create(task_params)
    redirect_to @tasks
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Task was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
   # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :body, :category)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = task.find(params[:id])
    end
end
