# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
  	sequence(:name) { |n| "Test task #{n}" }
  	completed false
  	association :list
  end
end
