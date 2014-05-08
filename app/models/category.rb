class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :content, presence:true, length: { maximum: 100 }, uniqueness: { case_sensitive: false }
end