@states = {
  OH: 'Ohio',
  WA: 'Washington',
  OR: 'Oregon',
  FL: 'Florida',
  CA: 'California',
  NY: 'New York',
  MI: 'Michigan'
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

@cities = {
  OH: ['CityOH1','CityOH2','CityOH3'],
  WA: ['CityWA1','CityWA2'],
  OR: ['CityOR1','CityOR2']
}

def describe_state (code)
  state = @states[code.to_sym] == nil ? "nothing" : @states[code.to_sym] #so you can enter invalid state
  numofcities = @cities[code.to_sym] == nil ? "no cities" : "#{@cities[code.to_sym].length} cities: " #so you can enter state without cities
  citiesnames = @cities[code.to_sym] == nil ? "" : @cities[code.to_sym].join(", ")
  return "#{code} is for #{state}. It has #{numofcities}" + citiesnames
end

def calculate_tax(code, amount)
  dollar = @taxrates[code.to_sym] == nil ? "nothing" : @taxrates[code.to_sym] * amount
  return "The total tax is: #{dollar}"
end

puts describe_state('WA')
puts calculate_tax('WA',15)
