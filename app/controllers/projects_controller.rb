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
    @a = []
    @items = @project.items
    @item = Item.new
    @item.project_id = @project.id
    @categories =Category.all
    @categories.each do |category|
      m=@items.select{|n| n.category_id == category.id}
      @a<<m unless m.blank?
      @a.last<< Item.new(title:"Всього", count:nil, price:nil,  total:@a.last.inject(0){|sum, n| sum+n.total}) unless m.blank?
    end
    @total = @a.inject(0){|sum, n| sum+n.last.total}
    respond_to do |f|
      f.html
      f.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename= "cost.xlsx"'
      }
    end

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
