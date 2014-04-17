# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list do
  	association :user
  	sequence(:name) { |n| "List No #{n}" }

  	factory :invalid_list do
  		name nil
  		user_id nil
  	end
  end
end