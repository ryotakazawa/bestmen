# frozen_string_literal: true

FactoryBot.define do
  factory :pic do
    title { 'MyString' }
    address {'東京都港区芝公園４丁目２−８'}
    description { 'MyText' }
  end
end
