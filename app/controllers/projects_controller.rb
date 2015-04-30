class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :statistics]

  # GET /projects
  # GET /projects.json

  #No users yet ,so sorting is done project wises
  #First a sort of all the critical tasks is done in the project individually "tempproject = project.tasks.sort { |a,b| a.deadline <=> b.deadline }"
  # #then they are all appended in a list *of critical tasks* to be sorted according to deadline
  # # You retrieve All the the projects, so the 'Index' view can use them.
  def index
    @projects = Project.all
end

  # GET /projects/1
  # GET /projects/1.json
  # veiws a single project that was clicked on.
  def show
  end

  # GET /projects/new
  # you create a new project
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  # you edit the project that you clicked on.
  def edit
  end

  # POST /projects
  # POST /projects.json
  # takes the information that you wrote on the form and uses it to create a project and saves it in the Database.
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  # you update the form that you filled after you created the project.
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  # you delete the project from the Database.
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def statistics
    @done_tasks = @project.tasks.where(status: 'Done').count 
    @left_tasks = @project.tasks.where.not(status: 'Done').count
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # those parameters are the ones that the user can enter.
    def project_params
      params.require(:project).permit(:title, :description, :deadline)
    end
end
