class Unit

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end
  attr_reader :health_points
  attr_reader :attack_power

  def attack!(enemy)
    enemy.damage(@attack_power)
  end

  def damage(power)

    @health_points -= power
  end

end
