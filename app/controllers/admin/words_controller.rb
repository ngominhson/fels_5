class WordsController < ApplicationController
  
  def index
    @words = Word.paginate page: params[:page]
  end

  def show
    @word = Word.find params[:id]
  end

  def destroy
    @word.destroy
    flash[:success] = "word deleted."
    redirect_to category_words_path
  end

  def create
    @word = category.words.build word_params
    if @word.save
      flash[:success] = "Create done!"
      category_words_path
    else
      flash[:faild] = "fail"
      render 'new'
    end    
  end

  def edit
    @word = Word.find params[:id]
  end

  def destroy
    word= Word.find params[:id]
    word.destroy
    flash[:success] = "Word deleted."
    redirect_to admin_words_url
  end

  private
    def position_params
      params.require(:word).permit(:name, :description, :category_id)    
    end  
end