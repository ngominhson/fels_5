class Option < ActiveRecord::Base
  belongs_to :word
  validates :word_id, presence: true

  scope :options, ->(word_id) do
    where(word_id: word_id)
  end 
end
