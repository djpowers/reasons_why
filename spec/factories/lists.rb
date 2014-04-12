# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list do
    title "My Meta List"
    subject_a "The Late Show"
    subject_b "List"
    adjective "loves"
    user
  end
end
