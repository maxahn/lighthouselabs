@states = {
  OH: {:state => 'Ohio', :cities => ['CityOH1','CityOH2','CityOH3','CityWA2']},
  WA: {:state => 'Washington', :cities => ['CityWA1','CityWA2']}
}

@taxrates = {
  OH: 0.22,
  WA: 0.15,
  OR: 0.17,
  FL: 0.10,
  CA: 0.50,
  NY: 0.14,
  MI: 0.11
}


def describe_state (code)
  state = @states[code.to_sym][:state] == nil ? "nothing" : @states[code.to_sym][:state] #so you can enter invalid state
  numofcities = @states[code.to_sym][:cities] == nil ? "no cities" : "#{@states[code.to_sym][:cities].length} cities: " #so you can enter state without cities
  citiesnames = @states[code.to_sym][:cities] == nil ? "" : @states[code.to_sym][:cities].join(", ")
  return "#{code} is for #{state}. It has #{numofcities}" + citiesnames
end

def calculate_tax(code, amount)
  dollar = @taxrates[code.to_sym] == nil ? "nothing" : @taxrates[code.to_sym] * amount
  return "The total tax is: #{dollar}"
end

def find_state(city)
  result = @states.select { |state_key, state_info| state_info[:cities].include?(city)}
  result.keys
end

puts describe_state('OH')
puts calculate_tax('OH',15)
puts find_state('CityWA2')
