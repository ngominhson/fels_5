class Word < ActiveRecord::Base
  belongs_to :category
  has_many :results
  has_many :lessions, through: :results
  validates :category_id, presence: true
  has_many :options, dependent: :destroy

  scope :generate_random_word, ->(category_id) do
    where(category_id: category_id).order("rand()").first
  end
   
  accepts_nested_attributes_for :options
end
