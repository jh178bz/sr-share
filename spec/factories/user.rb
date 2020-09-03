FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "guest@example.com" }
    password { "password" }
  end

  factory :followed_user do
    name { "テストユーザー2" }
    email { "guest2@example.com" }
    password { "password" }
  end

  factory :admin do
    name { "管理者ユーザー" }
    email { "admin@example.com" }
    password { "password" }
  end
end
