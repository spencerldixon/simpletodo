# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
  	association :list
  	sequence(:name) { |n| "Test task #{n}" }
  	completed false
  end
end
