class ItemsController < ApplicationController
  before_action :set_project

  def create
    @item = @project.items.build(item_params)
    if @item.save
      redirect_to project_path(@project.id)
    end
  end
  def destroy
    item = Item.find(params[:id])
    @project.items.delete item
    redirect_to @project
    
  end
  private
  
  def item_params
    params.require(:item).permit( :category_id, :title, :count, :price, :total)
  end
  
  def set_project
    @project = Project.find(params[:project_id]) 
  end
  
end