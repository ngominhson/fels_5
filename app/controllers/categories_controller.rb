class CategoriesController < ApplicationController
  
  def index
    @categories = Category.paginate page: params[:page] 
  end

  def show
    @category = Category.find params[:id]
    @words = @category.words.paginate page: params[:page]
  end

  def destroy
    category= Category.find(params[:id])
    category.destroy
    flash[:success] = "Category deleted."
    redirect_to admin_categories_path
  end

end