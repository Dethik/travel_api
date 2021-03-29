# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    seed = Seed.new
    seed.generate_destinations
  end

  def generate_destinations
    20.times do |i|
      destination = Destination.create!(
        country: Faker::Address.country,
        state: Faker::Address.state,
        city: Faker::Address.city
      )
      5.times do |i|
        Review.create!(author: Faker::FunnyName.two_word_name, content: Faker::Lorem.paragraph_by_chars(number: 75, supplemental: false), rating: Faker::Number.between(from: 1, to: 5), destination_id: destination.id)
      end
    end
  end
end

Seed.begin