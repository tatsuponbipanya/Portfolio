# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :user do
    name {'MyString'}
    email {'MyString'}
  end
end
