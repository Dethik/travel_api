class Destination < ApplicationRecord
  has_many :reviews
  validates :country, :presence => true
  validates :city, :presence => true
  scope :search, -> (city) { where("city like?", "%#{city}%")}
end