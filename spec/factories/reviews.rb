FactoryBot.define do
  factory :review do
    title { "MyString" }
    content { "MyText" }
    image { "MyString" }
    user { nil }
    item { nil }
    rate { 1.5 }
  end
end
