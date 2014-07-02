class Animal

  attr_reader :blood

  WARM_BLOODED = :warm
  COLD_BLOODED = :cold

  def initialize(bloodness)
    @blood = bloodness
  end

end

class Mammal < Animal
  attr_reader :hair_type, :num_legs

  def initialize(hair_type, num_legs)
    super(WARM_BLOODED)
    @hair_type = hair_type
    @num_legs = num_legs
  end

end

class Amphibian < Animal
end

class Primate < Mammal
  
  def initialize(hair_type)
    super(hair_type, 2)
  end

end

class Frog < Amphibian
end

class Bat < Mammal
end

class Chimpanzee < Mammal
end