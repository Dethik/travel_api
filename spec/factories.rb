FactoryBot.define do
  factory(:destination) do
    country {Faker::Address.country}
    state {Faker::Address.state}
    city {Faker::Address.city}
  end
  factory(:review) do
    author {Faker::FunnyName.two_word_name}
    content {Faker::Lorem.paragraph_by_chars(number: 75, supplemental: false)}
    rating {Faker::Number.between(from: 1, to: 5)}
  end
end