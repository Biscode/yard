  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    include ProjectsHelper
    # GET /projects
    # GET /projects.json

    #No users yet ,so sorting is done project wises
    #First a sort of all the critical tasks is done in the project individually "tempproject = project.tasks.sort { |a,b| a.deadline <=> b.deadline }"
    #then they are all appended in a list *of critical tasks* to be sorted according to deadline
    # You retrieve All the the projects, so the 'Index' view can use them.
    def index
      @projects = []
      for project in Project.all do
        if project.isPrivate
          if current_user != nil
            if isAdmin(current_user) or canView(current_user, project)
              @projects.push(project)
            end
          end
        else
          @projects.push(project)
        end
      end

      @criticaltasks = []
      if @projects != nil
        @projects.each do |project|
        tempproject = project.tasks.sort { |a,b| a.deadline <=> b.deadline }
        @criticaltasks += tempproject if tempproject
      end
        @criticaltasks = @criticaltasks.sort { |a,b| a.deadline <=> b.deadline }
      else
        @sentence = "Yaaay you have no critical tasks"
      end
    end

  #No users yet ,so sorting is done project wises
  #First a sort of all the critical tasks is done in the project individually "tempproject = project.tasks.sort { |a,b| a.deadline <=> b.deadline }"
  #then they are all appended in a list *of critical tasks* to be sorted according to deadline
  # You retrieve All the the projects, so the 'Index' view can use them.
<<<<<<< HEAD
=======
  def index
    @projects = Project.all
end

>>>>>>> 2a4e3ffb73c1609b70fcfec2318d759011c7b955
  # GET /projects/1
    # GET /projects/1.json
    # views a project that was clicked on only if the project is not private or if the user is the admin or logged in.
    # otherwise it prints a  message "you don't have permissions to view this project" 
    def show
      @showProject = true

      if @project.isPrivate
        if current_user == nil or !(isAdmin(current_user) or canView(current_user, project))
          @sentence = "You don't have permissions to view this project"
          @showProject = false
        end
      end
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

    private
      # Use callbacks to share common setup or constraints between actions.
    def set_project
        @project = Project.find(params[:id])
    end

      # those parameters are the ones that the user can enter.
      # added the :isPrivate parameter to specify if the project is private or not.
    def project_params
        params.require(:project).permit(:title, :description, :deadline, :isPrivate)
    end
  end
