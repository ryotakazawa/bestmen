FactoryBot.define do
  factory :user, class: User do
      name     {"Example user"}
      email    {"user@example.com"}
      password              {"foobar"}
      password_confirmation {"foobar"}
  end
end