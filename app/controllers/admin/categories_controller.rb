class Admin::CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find params[:id]
  end

  def index
    @categories = Category.paginate page: params[:page]
  end

  def show
    @category = Category.find params[:id]
    @words = @category.words.paginate page: params[:page]
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Create done!"
      redirect_to admin_categories_path
    else
      flash[:faild] = "Faild ! "
      render 'new'
    end
  end

  def destroy
    category= Category.find(params[:id])
    category.destroy
    flash[:success] = "Category deleted."
    redirect_to admin_categories_path
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = "update success!"
      redirect_to admin_categories_path
    else
      flash[:faild] = "Faild !"
      render 'edit'
    end
  end    

  private
    def category_params
      params.require(:category).permit(:name, :content)    
    end
end