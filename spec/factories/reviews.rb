FactoryBot.define do
  factory :review do
    title { "テストタイトル" }
    content { "テストコンテント" }
    image { nil }
    association :user
    association :item
    rate { 1.5 }
  end
end
