class Word < ActiveRecord::Base
  belongs_to :category
  validates :category_id, presence: true
  has_many :options, dependent: :destroy
end
