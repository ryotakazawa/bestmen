# frozen_string_literal: true

FactoryBot.define do
  factory :pic do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    title { 'MyString' }
    description { 'MyText' }
  end
end
