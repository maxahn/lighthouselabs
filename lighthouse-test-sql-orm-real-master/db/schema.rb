# DO NOT MODIFY

ActiveRecord::Schema.define do
  create_table :suites, force: true do |t|
    t.string     :number
    t.integer    :rate
    t.integer    :capacity
    t.integer    :revenue, default: 0
    t.timestamps
  end

  create_table :bookings, force: true do |t|
    t.references :suite
    t.string     :full_name
    t.integer    :guests
    t.date       :checkin
    t.date       :checkout
    t.integer    :discount_per_night
    t.timestamps
  end

end
