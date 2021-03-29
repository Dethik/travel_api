FactoryBot.define do
  factory(:destination) do
    country {Faker::Address.country}
    state {Faker::Address.state}
    city {Faker::Address.city}
  end
end