# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name                  { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { "1a#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    tel                   { Faker::Number.leading_zero_number(digits: 11) }
    comment               { Faker::Lorem.sentence }
  end
end
