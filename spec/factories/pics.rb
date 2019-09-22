# frozen_string_literal: true

FactoryBot.define do
  factory :pic do
    user_id { 1 }
    title { 'MyString' }
    address { '東京都港区芝公園４丁目２−８' }
    description { 'MyText' }
    tag_list { '激辛系' }
  end
end
