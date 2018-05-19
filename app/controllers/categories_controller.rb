class CategoriesController < ApplicationController
  
  
  def index
    @categories = Category.all 
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      notice "category can't be blank"
    end
  end
  
  def edit
    
  end
  
  def update
    if @category.update
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
  def destroy
    @category.destroy
    respond_to do |format|
      redirect_to categories_path
    end
    
  end
  private
  
  def category_params
     params.require(:category).permit(:title)
    
  end
  def set_category
    @category = Category.find(params[:id])
  end
  
    
end