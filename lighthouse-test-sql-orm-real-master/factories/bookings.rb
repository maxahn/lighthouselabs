FactoryGirl.define do
  factory :booking do
    suite
    full_name Faker::Name.name
    guests    2
    checkin   { 1.days.from_now.to_date }
    checkout  { 2.days.from_now.to_date }
    discount_per_night 20

    factory :previous_booking do
      checkin  { 30.days.ago.to_date }
      checkout { 28.days.ago.to_date }
    end

    factory :current_booking do
      checkin  { 1.day.ago.to_date }
      checkout { 1.day.from_now.to_date }
    end

  end
end
