# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    body "MyString"
    show_id 1
    user_id 1
  end
end
