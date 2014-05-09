class LessonsController < ApplicationController
  before_action :signed_in_user

  def show
    @lesson = Lesson.find params[:id]
  end

  def new
    @lesson = Lesson.new(category_id: params[:category_id], result: nil, user_id: current_user.id)
    if @lesson.save
      words = Word.generate_random_word @lesson.category_id
      words.each do |word|
        LessonWord.create(lesson_id: @lesson.id, word_id: word.id)
      end
      redirect_to new_lesson_result_path(lesson_id: @lesson.id)
    end
  end

  def index
    @lessons = Lesson.paginate page: params[:page]
  end

  def destroy
  end



  private
    def lesson_params
      params.require(:lesson).permit(:category_id, :result, :user_id)
    end
end