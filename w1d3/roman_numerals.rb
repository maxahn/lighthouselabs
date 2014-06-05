  require 'pry'

  @roman_mapping = 
    {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
    }


# Mika's way
def to_roman(num)
  
  result = ''
  mod_result = 0
  remainder = 0
  number = num
  @roman_mapping.keys.each do |x|
    mod_result, remainder = number.divmod(x)
    result << @roman_mapping[x] * mod_result
    number = remainder
  end
  result
end

# Tom's way, without using modulus or divmod
def to_roman2(num)
  result = ""
 
  @roman_mapping.each do |pair|
    value = pair[0]
    roman = pair[1]
    division_result = num / value
    result += roman * division_result
    num = num - (value * division_result)
  end
  return result
end

# Monica's way, without using modulus or divmod
def to_roman3(num)
  result = ""
  @roman_mapping.each do |pair|
    value = pair[0]
    binding.pry
    roman = pair[1]
    level_occurance = num / value
    level_occurance.times do |x|
      result << roman
    end
    num = num - value * level_occurance
  end
  return result
end

# def to_roman3(num)
#   remainder = 1
#   while remainder != 0
#     result += 
#     remainder = num % 
#   end
# end
# Drive code... this should print out trues.
 
puts to_roman(1) == "I"
puts to_roman(3) == "III"
puts to_roman(6) == "VI"
puts to_roman3(464) == "CDLXIV"
puts to_roman2(464)
puts to_roman3(1256)


 
# TODO: what other cases could you add to ensure your to_roman method is working?