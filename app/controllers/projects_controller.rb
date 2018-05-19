class ProjectsController < ApplicationController
  before_action :set_project, only:[:destroy, :show]
  
  def index
    @projects = Project.all 
  end
  
 
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project.id)
    else
      notice "category can't be blank"
    end
  end
  def show
  end
  
  
  def destroy
    @project.destroy
    respond_to do |format|
      redirect_to projects_path
    end
    
  end
  private
  
  def project_params
     params.require(:project).permit(:title)
    
  end
  def set_project
    @project = Project.find(params[:id])
  end
    
end