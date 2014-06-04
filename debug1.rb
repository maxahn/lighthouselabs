def average(numbers)
  sum = 0
  numbers.delete_if {|x| x == nil}
  numbers.each do |num|
    num = num.is_a?(String) ? num.to_i : num
    sum += num
  end
  if numbers.size == 0
    return 0
  else 
    sum = (sum % numbers.size == 0) ? sum : sum.to_f
    sum / numbers.size
  end
end
 
## TEST HELPER METHOD
def test_average(array = [])
  print "avg of #{array.inspect}:"
  result = average(array)
  puts result
end
 
## TEST CODE
test_average([4,5,6]) # => 5
test_average([15,5,10]) # => 10
 
# Should treat string like number
test_average([15,'5',10]) # => 5
 
# Should show decimal value
test_average([10, 5]) # => 7.5 instead of just 7
 
# Empty set should return 0 as average, not throw an error
test_average([]) # => 0
 
# Non-existent set should return 0
test_average() # => 0
 
# BONUS: Should ignore nils in the set
test_average([9,6,nil,3]) # => 6