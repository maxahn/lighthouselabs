# Be careful, pasting this into IRB/Pry will take a long time to print.
# It's a loooong string. :)


def benchmark
  start_time = Time.now
  yield
  end_time = Time.now
  end_time - start_time

  # Your benchmarking code goes here.
end
 
# Be careful, pasting this into IRB will take a long time to print.
# It's a loooong string. :)
long_string = "apple"*100000000
 
running_time = benchmark { long_string.reverse }
 
puts "string.reverse took #{running_time} seconds to run"

## Working with blocks, put the block inside the method, imagine where you would put it for the method(without block) to work, then replace it with "yield", then call the method with block.
## So when you call a method with a block as parameter, it pass in that block where "yield" is located in a method, then take the final output of the method as value
