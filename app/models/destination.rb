class Destination < ApplicationRecord
  has_many :reviews
  validates :country, :presence => true
  validates :city, :presence => true, uniqueness: {case_sensitive: false}
  scope :by_country, -> (country) { where("lower(country) like?", "%#{country}%")}
  scope :by_state, -> (state) { where("lower(state) like?", "%#{state}%")}
  scope :by_city, -> (city) { where("lower(city) like?", "%#{city}%")}
end