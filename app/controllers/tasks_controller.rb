class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json

  # tasks are sorted by their status by default.
  # added some extra sorting features, you can sort by title, priority.....etc
  # If a specific sprint is chosen, only the tasks in this sprint will appear
  # sorted ascendingly by their deadline.
  def index
    @tasks = Task.find_by_sql("SELECT * FROM tasks ORDER BY CASE status
                                                            WHEN '' THEN 1
                                                            WHEN 'in progress' THEN 2
                                                            WHEN 'reviewing' THEN 3
                                                            WHEN 'done' THEN 4 END")
    @sortType = params[:sort]

    if @sortType == "title"
    @tasks = Task.find_by_sql("SELECT * FROM tasks ORDER BY title ASC")
     end

    if @sortType == "status"
      @tasks = Task.find_by_sql("SELECT * FROM tasks ORDER BY CASE status
                                                            WHEN '' THEN 1
                                                            WHEN 'in progress' THEN 2
                                                            WHEN 'reviewing' THEN 3
                                                            WHEN 'done' THEN 4 END")
    end

    if @sortType == "description"
      @tasks = Task.find_by_sql("SELECT * FROM tasks ORDER BY description ASC")
    end

    if @sortType == "deadline"
      @tasks = Task.find_by_sql("SELECT * FROM tasks ORDER BY deadline ASC")
    end


    if @sortType == "story_points"
      @tasks = Task.find_by_sql("SELECT * FROM tasks ORDER BY story_points ASC")
    end

    if @sortType == "priority"
      @tasks = Task.find_by_sql("SELECT * FROM tasks ORDER BY CASE priority
                                                              WHEN '' THEN 1
                                                              WHEN 'high' THEN 2
                                                              WHEN 'medium' THEN 3
                                                              WHEN 'low' THEN 4 END")
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end

  # GET /tasks/1/edit
  def edit
    @project = Project.find(params[:project_id])
  end

  # POST /tasks
  # POST /tasks.json
  # Create a new task in a certain sprint inside a project.
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @project, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  # Update the attributes of a task.
  def update
    @project = Project.find(params[:project_id])

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @project, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  # Delete an unwanted task.
  def destroy
    @project = Project.find(params[:project_id])

    @task.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:title, :description, :status, :priority, :story_points, :deadline)
  end
end
