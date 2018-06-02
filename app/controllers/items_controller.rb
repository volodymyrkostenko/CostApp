class ItemsController < ApplicationController
  before_action :set_project

  def create

    @item = @project.items.build(item_params)
    @items = @project.items.select{|n| @item.category_id ==n.category_id}
    respond_to do |format|
      if @item.save
        format.html{redirect_to project_path(@project.id)}
        format.js
      end
      @s = @items.inject(0){|sum, n| sum+n.total}
      @total = @project.items.inject(0){|sum, n| sum + n.total}
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
