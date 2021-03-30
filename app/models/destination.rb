class Destination < ApplicationRecord
  has_many :reviews
  validates :country, :presence => true
  validates :city, :presence => true, uniqueness: {case_sensitive: false}
  scope :search, -> (city) { where("lower(city) like?", "%#{city}%")}

end