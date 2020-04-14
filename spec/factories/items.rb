FactoryBot.define do
  factory :item do
    name  { Faker::Name.name }
    price { Faker::Number.between(from: 100, to: 300) }
    category 
    # category { category.create{....}}
  end
end

