require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

Store.create(name: "Surrey", annual_revenue: 224000, mens_apparel: false, womens_apparel: true)

whistler = Store.create(name: "Whistler", annual_revenue: 1900000, mens_apparel: false, womens_apparel: false)

Store.create(name: "Yaletown", annual_revenue: 430000, mens_apparel: true, womens_apparel: true)

@mens_stores = Store.where(mens_apparel: true, womens_apparel: false)

puts "first fetch"
@mens_stores.each do |x|
  puts x.name + x.annual_revenue.to_s
end

@another_fetch = Store.where(womens_apparel: true).where('annual_revenue < 1000000')

puts "second fetch"
@another_fetch.each do |x|
  puts x.name + x.annual_revenue.to_s
end