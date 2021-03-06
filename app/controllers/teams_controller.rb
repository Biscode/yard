class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  # lists all the teams and finds the project by id.
  def index
    @project = Project.find(params[:project_id])
    @teams = @project.teams
  end

  # GET /teams/1
  # GET /teams/1.json
  # lists all the users registered.
  def show
    @users = User.all
  end

  # GET /teams/new
  def new
    @project = Project.find(params[:project_id])
    @team = @project.teams.build
  end

  # GET /teams/1/edit
  def edit
    @project = Project.find(params[:project_id])
  end

  # POST /teams
  # POST /teams.json
  # creates a team for the project.
  def create
    @project = Project.find(params[:project_id])
    @team = @project.teams.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @project, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  # updates the team.
  def update
    @project = Project.find(params[:project_id])

    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @project, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  # Delete the team.
  def destroy
    @project = Project.find(params[:project_id])
    @team.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :project_id)
    end
end
