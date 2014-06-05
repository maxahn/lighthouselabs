
# It requires the other files/gems that it needs
 
require 'pry'
require 'colorize'
require './candidates'
require './filters'
 
## Your test code can go here
 
# binding.pry
 
# pp qualified_candidates
# puts @qualified_candidates

  # def experienced?(candidate)
  #   candidate.each do |x|
  #    if x[:years_of_experience] > 2
  #       puts x[:id]
  #       puts "true"
  #     else
  #     end
  #   end
  # end



loop do
  puts "Enter your command: "
  command = gets.chomp
  command, id = command.split(" ")
  id = id.to_i
  break if command == "quit"
  case command
  when "find"
    puts find(id)
  when "all"
    cans = ordered_by_qualifications(@candidates)
    qualified_color(cans)
  when "qualified"
    puts qualified_candidates(@candidates)
  else
    puts "This an invalid command, please start over."
  end
end
# puts experienced?(@candidates)
# puts qualified_candidates(@candidates)

