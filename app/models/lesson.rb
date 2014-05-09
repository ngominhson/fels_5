class Lesson < ActiveRecord::Base
  has_many :results
  has_many :words, through: :results
end

