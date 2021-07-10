# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com" }
    password { SecureRandom.base64[0..3] }
    password_confirmation { password.to_s }
  end
end
