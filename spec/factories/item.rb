FactoryBot.define do
  factory :item do
    name { "テストアイテム" }
    content { "テストコメント" }

    factory :item_with_review do
      after(:create) do | item |
        create(:reviews, item: item)
      end
    end
  end
end
