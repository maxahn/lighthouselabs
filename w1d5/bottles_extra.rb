@total_bottles = 0
@total_recycled = 0
@total_caps = 0
@empty_left = 0
@caps_left = 0

#below is the recursive version
def recursive_bottles(money, new_bottles, full_bottles_from_empty, full_bottles_from_caps)

  full_bottles_from_empty, @empty_left = ( new_bottles + @empty_left ).divmod(2)
  full_bottles_from_caps, @caps_left = ( new_bottles + @caps_left ).divmod(4)
  new_bottles = (full_bottles_from_empty + full_bottles_from_caps)

  @total_bottles += new_bottles
  @total_recycled += full_bottles_from_empty
  @total_caps += full_bottles_from_caps
  
  if (full_bottles_from_empty || full_bottles_from_caps) != 0
    recursive_bottles(money, new_bottles, full_bottles_from_empty, full_bottles_from_caps)
  end

end




#Below is non recursive method, its broken due to changed variables for recursive method above, for reference only
# def total_bottles(money)
#   total_bottles = money / 2
#   new_bottles = total_bottles
#   full_bottles_from_empty = 1
#   full_bottles_from_caps = 1
#   total_recycled = 0
#   total_caps = 0
#   empty_left = 0
#   caps_left = 0
#   while (full_bottles_from_empty || full_bottles_from_caps) != 0
#     full_bottles_from_empty, empty_left = ( new_bottles + empty_left ).divmod(2)
#     full_bottles_from_caps, caps_left = ( new_bottles + caps_left ).divmod(4)
#     new_bottles = (full_bottles_from_empty + full_bottles_from_caps)
#     total_bottles += new_bottles
#     total_recycled += full_bottles_from_empty
#     total_caps += full_bottles_from_caps
#   end
#   puts "You will get #{total_bottles} total bottles"
#   puts "#{money/2} many of them were purchased directly"
#   puts "#{total_recycled} many of them were from recycled empty bottles"
#   puts "#{total_caps} many of them were from caps"
#   puts "#{caps_left} caps and #{empty_left} empty bottles are left over"
# end

# $20 = 30 bottles

# 10 bottles
# 10 empty bottles = give 5 new bottles, no bottles left
# 10 caps = give 2 new bottles, 2 caps left

# total_bottles = money / 2
# new_bottles = total_bottles
# while (full_bottles_from_empty && full_bottles_from_caps) == 0
#   full_bottles_from_empty, empty_left = ( new_bottles + empty_left ).divmod(2)
#   full_bottles_from_caps, caps_left = ( new_bottles + caps_left ).divmod(4)
  
#   new_bottles = full_bottles_from_empty + full_bottles_from_caps
  
#   total_bottles += new_bottles
# end
# total_bottles

# 7 new bottles and 2 caps
# 7 empty bottles = gives 3 new bottles, 1 empty left
# 7 + 2 caps = give 2 new bottles, 1 caps left

# 5 new bottles and 1 empty, 1 caps
# 6 empty = 2 new
# 6 caps = 1 new + 2 caps

# 3 new bottles, 2 caps
# 3 empty = 1 new, 1 empty
# 5 caps = 1 new, 1 caps

# 2 new bottles, 1 empty, 1 caps
# 3 empty = 1 new, 1 empty
# 3 caps = no new, 3 caps

# 1 new bottle, 1 empty, 3 caps
# 2 empty = 1 new, 0 empty
# 4 caps = 1 new, 0 caps

# 2 new bottle
# 2 empty = 1 new
# 2 caps = 0 new, 2 caps

# 1 new bottle, 2 caps
# finished.

# $10 = 5 new

# 5empty = 2 new + 1 empty
# 5caps = 1 new + 1 caps
# 3 new

# 4empty = 2 new
# 4caps = 1 new
# 3 new

# 3empty = 1 new + 1 empty
# 3caps = 3 caps
# 1 new

# 2empty = 1 new
# 4caps = 1 new
# 2 new

# 2empty = 1 new
# 2caps = 2 caps
# 1 new

# 1empty
# 3caps

