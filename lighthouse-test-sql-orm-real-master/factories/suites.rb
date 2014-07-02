FactoryGirl.define do
  factory :suite do
    sequence :number, 1000
    rate     100
    capacity 4
  end
end
