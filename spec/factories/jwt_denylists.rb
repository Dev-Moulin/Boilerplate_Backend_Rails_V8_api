FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2025-03-05 16:40:13" }
  end
end
