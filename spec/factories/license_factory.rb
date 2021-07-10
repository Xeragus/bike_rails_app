# frozen_string_literal: true

FactoryBot.define do
  factory :license do
    sequence(:license_number) { SecureRandom.uuid }
    sequence(:name) { |n| "Homer Simpsons #{n}" }
    date_of_birth { DateTime.now }
    sequence(:email) { |n| "homer#{n}@test.com" }
  end
end