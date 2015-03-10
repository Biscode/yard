class ProjectsController < ApplicationController

  def index
    @project = Project.all
  end
#------------------------------------------------

  def show
    @project = Project.find(params[:id])
  end
#------------------------------------------------

  def new
    @project = Project.new
  end
#------------------------------------------------

  def create
    @project = Project.new(proj_parameters)


    if @project.title.blank?
      flash[:notice] = "You must enter a title"
      render('new')
    else
      @project.save
      redirect_to(:controller => 'projects', :action => 'index')
      flash[:notice] = "project created successfully"
    end
  end
#------------------------------------------------

  def edit
    @project = Project.find(params[:id])
  end
#------------------------------------------------

   def update
    @project = Project.find(params[:id])

    if @project.update_attributes(proj_parameters)
      redirect_to(:action => 'index')
      flash[:notice] = "project updated successfully"
    else
      render('edit')
    end
  end
#------------------------------------------------

  def delete
    @project = Project.find(params[:id])
  end
#------------------------------------------------

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "'#{@project.title}' deleted successfully"
    redirect_to(:action =>'index')
  end
#------------------------------------------------

private
def proj_parameters
  params.require(:project).permit(:title, :description, :deadline)
end


end
