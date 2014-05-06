class Option < ActiveRecord::Base
  belongs_to :word
  validates :word_id, presence: true
end
