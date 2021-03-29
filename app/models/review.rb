class Review < ApplicationRecord
  belongs_to :destination
  validates :author, :presence => true
  validates :content, :presence => true
  validates :rating, :presence => true
end