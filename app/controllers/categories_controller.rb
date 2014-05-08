class CategoriesController < ApplicationController
  
  def index
    @categories = Category.paginate page: params[:page] 
  end

  def show
    @category = Category.find params[:id]
    @words = @category.words.paginate page: params[:page]
  end

end