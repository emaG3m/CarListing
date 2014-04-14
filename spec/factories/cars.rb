# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    color "red"
    year 1988
    mileage 109867
    description "MyString"
  end
end
