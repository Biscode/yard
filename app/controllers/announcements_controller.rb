class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  # GET /announcements
  # GET /announcements.json
  def index
  @project = Project.find(params[:project_id])
  @announcements = @project.announcements
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
  end

  # POST /announcements
  # POST /announcements.json
  # Create a new announcement inside a specific project.
  def create
  @project = Project.find(params[:project_id])
  @announcement = @project.announcements.new(announcement_params)

  respond_to do |format|
  if @announcement.save
  format.html { redirect_to project_path(@project), notice: 'Announcement was successfully created.' }
  format.json { render :show, status: :created, location: @announcement }
  else
  format.html { render :new }
  format.json { render json: @announcement.errors, status: :unprocessable_entity }
  end
end
end

  # PATCH/PUT /announcements/1
  # PATCH/PUT /announcements/1.json
		# Update the attributes of the announcement.
	  def update
	 	respond_to do |format|
		  if @announcement.update(announcement_params)
		    format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
		    format.json { render :show, status: :ok, location: @announcement }
		  else
		    format.html { render :edit }
		    format.json { render json: @announcement.errors, status: :unprocessable_entity }
 end
		end
	  end

	  # DELETE /announcements/1
	  # DELETE /announcements/1.json
	 	# Delete an unwanted announcement.
	  def destroy
		  @announcement.destroy
	 	 respond_to do |format|
		  format.html { redirect_to announcements_url, notice: 'Announcement was successfully destroyed.' }
		  format.json { head :no_content }
		end
	  end

	  private
		# Use callbacks to share common setup or constraints between actions.
		def set_announcement
		  @announcement = Announcement.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
	 # Only input the parameters of the sprint which is the announcement body.
		def announcement_params
		  params.require(:announcement).permit(:announcement)
		end
	end
