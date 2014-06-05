def calculate(num1, num2)
  puts yield(num1, num2)
end

calculate(1, 2) do |a, b|
  a + b
end


