require './bottles_extra'
new_bottles = 0
full_bottles_from_empty = 0
full_bottles_from_caps = 0

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
  @total_bottles = (money.to_i / 2)
  new_bottles = @total_bottles
  recursive_bottles(money, new_bottles, full_bottles_from_empty, full_bottles_from_caps)
  
  puts "You will get #{@total_bottles} total bottles"
  puts "#{money.to_i/2} of them were purchased directly"
  puts "#{@total_recycled} many of them were from recycled empty bottles"
  puts "#{@total_caps} many of them were from caps"
  puts "#{@caps_left} caps and #{@empty_left} empty bottles are left over"
  
end
