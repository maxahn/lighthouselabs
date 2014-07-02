class Fish
  def initialize(weight, value)
    @weight = weight
    @value = value
    @value_per_kg = value.to_f / weight
  end

  attr_reader :weight
  attr_reader :value
  attr_reader :value_per_kg

end