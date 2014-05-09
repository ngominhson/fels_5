class ResultsController < ApplicationController

  def new
    @result = Result.new
    @lesson = Lesson.find params[:lesson_id]
    @word = Word.generate_random_word @lesson.category_id
    @options = Option.options @word.id
  end

  def create
    @result = Result.new result_params
    @result.choosen = params[:option_id]
    if @result.save
      redirect_to :back
    else
      flash[:fail] = "fail"
      render "new"
    end
  end

  private
    def result_params
      params.require(:result).permit(:lesson_id, :choosen, :word_id)
    end

end