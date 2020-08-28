FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "guest@example.com" }
    password { "password" }
  end
end
