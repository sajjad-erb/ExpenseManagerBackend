FactoryBot.define do
  factory :account do
    account_title { "My Account" }
    sequence(:account_no) { |n| n }
    balance { 1000 }
    user

    factory :account_title do
      account_title { nil }
    end

    factory :account_no do
      account_no { nil }
    end

    factory :balance do
      balance { nil }
    end
  end
  factory :user do
    sequence(:email) { |n| "user#{n*rand(100..100_000)}@example.com" }
    password { "password" }
  end
end
