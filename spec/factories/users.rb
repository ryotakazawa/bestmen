# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name  {'testuser1'} 
    email {'testuser1@gmail.com'}
    password  {'123456789'}
  end
end
