FactoryGirl.define do
  factory :user_profile do
    name { Forgery::Name.full_name }
  end
end