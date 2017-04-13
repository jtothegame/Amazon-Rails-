FactoryGirl.define do
  factory :user do
      first_name 'John'
      last_name 'Wick'
      sequence(:email) { |n| "John#{n}@example.com"}
      password '4d3d3d3'
  end
end
