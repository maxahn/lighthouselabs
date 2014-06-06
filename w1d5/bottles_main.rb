require './bottles_extra'

# 2 empty = 1 full
# 4 caps = 1 full
# 1 full = $2

# total = 0
# money / 2 = fulls
# total = fulls
# fulls / 2 + fulls / 4 = fulls
# total += fulls
# until fulls = 0


loop do
  puts "How much money do you want to spend? "
  money = gets.chomp
  break if money == "quit"
  puts total_bottles(money.to_i)
end
