class Lesson < ActiveRecord::Base
  has_many :results
  has_many :lesson_words
  has_many :words, through: :results
  has_many :words, through: :lesson_words
end

