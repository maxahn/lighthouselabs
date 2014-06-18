require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "Don", last_name: "Marks", hourly_rate: 100)
@store1.employees.create(first_name: "Markus", last_name: "Weiler", hourly_rate: 40)


@store2.employees.create(first_name: "Nicholas", last_name: "Coops", hourly_rate: 80)
@store2.employees.create(first_name: "John", last_name: "West", hourly_rate: 10)

