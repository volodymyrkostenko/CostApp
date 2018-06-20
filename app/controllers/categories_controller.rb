class CategoriesController < ApplicationController


  def index
    @categories = Category.all
  end


  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      notice "category can't be blank"
    end
  end


  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
        
  end
  private

  def category_params
     params.require(:category).permit(:title)

  end



end
