class SprintsController < ApplicationController
  before_action :set_sprint, only: [:show, :edit, :update, :destroy]

  # GET /sprints
  # GET /sprints.json
  # Get the sprints of a specific project.
   def index
    @project = Project.find(params[:project_id])
    @sprints = @project.sprints
   end

  # GET /sprints/1
  # GET /sprints/1.json
   def show
   end

  # GET /sprints/new
   def new
     @project = Project.find(params[:project_id])
     @sprint = @project.sprints.build
  end

  # GET /sprints/1/edit
   def edit
     @project = Project.find(params[:project_id])
   end

  # POST /sprints
  # POST /sprints.json
  # Create a new sprint inside a specific project.
   def create
    @project = Project.find(params[:project_id])
    @sprint = @project.sprints.new(sprint_params)

    respond_to do |format|
      if @sprint.save
        format.html { redirect_to @project, notice: 'Sprint was successfully created.' }
        format.json { render :show, status: :created, location: @sprint }
      else
        format.html { render :new }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
     end
   end

  # PATCH/PUT /sprints/1
  # PATCH/PUT /sprints/1.json
  # Update the attributes of the sprint.
   def update
     @project = Project.find(params[:project_id])

    respond_to do |format|
      if @sprint.update(sprint_params)
        format.html { redirect_to @project, notice: 'Sprint was successfully updated.' }
        format.json { render :show, status: :ok, location: @sprint }
      else
        format.html { render :edit }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
     end
   end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  # Delete an unwanted sprint.
  def destroy
    @project = Project.find(params[:project_id])

    @sprint.destroy
    respond_to do |format|
      format.html { redirect_to sprints_url, notice: 'Sprint was successfully destroyed.' }
      format.json { head :no_content }
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   def set_sprint
    @sprint = Sprint.find(params[:id])
   end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Only input the parameters of the sprint which are its number and deadline.
   def sprint_params
    params.require(:sprint).permit(:number, :deadline)
   end
end
