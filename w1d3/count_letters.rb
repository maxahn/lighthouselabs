# break up a string into characters and count the occurance of each letter
# don't count spaces
# for count hash: output to :a => 5
# for index hash: output to :a => [1,3,5]
# use .each_with_index

def count_letters_each(string) # #each version
  count = Hash.new
  splited_string = string.delete(' ').split("") # delete(' ') remove whitespaces
  splited_string.each do |n|
    count[n] = string.count(n)
  end
  count
end

def count_letters_inject(string) # #inject version
  splited_string = string.delete(' ').split("")
  splited_string.inject(Hash.new(0)) do |result, count|
    result[count] += 1
    result
  end
end

def character_position(string) # The trick is the define the hash properly, so that it expects an array as value to keys
  splited_string = string.delete(' ').split("")
  location_hash = Hash.new{|k, v| k[v] = []}
  splited_string.each_with_index do | char, index |
    location_hash[char].push( index + 1 )
  end
  location_hash
end

puts count_letters_each('alan is     the best')

puts count_letters_inject('alan is the best')

puts character_position('alan is the best')