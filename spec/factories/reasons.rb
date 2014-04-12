# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reason do
    sequence(:body) { |n| "You can convey so much information in a list-based format. #{n}" }
    list
  end
end
