require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
puts "enter store name: "
store_name = gets.chomp
s = Store.create(name: store_name)


puts s.errors[:annual_revenue]
puts s.errors[:mens_apparel]
puts s.errors[:womens_apparel]