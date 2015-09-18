FactoryGirl.define do
  factory :user_factory, class: :user do
    email 'foo@bar.com'
    password '12345678'
  end
end
