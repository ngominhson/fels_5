class WordsController < ApplicationController
  def new
  end

  def index
    @words = Word.paginate page: params[:page]
  end

  def show
  end
end
