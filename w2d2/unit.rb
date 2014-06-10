class Unit

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end
  attr_reader :health_points
  attr_reader :attack_power

  def attack!(enemy)
    if self.dead? == true
      return false
    elsif enemy.dead? == true
      return false
    elsif self.class == SeigeEngine && (enemy.class == Peasant || enemy.class == Footman)
      return false
    elsif self.class == SeigeEngine && enemy.class == Barracks        
      enemy.damage((attack_power * 2).ceil)
    elsif (self.class == Peasant || self.class == Footman) && enemy.class == Barracks
      enemy.damage((attack_power / 2).ceil)
    else
      enemy.damage(attack_power)
    end
  end

  def damage(power)
    @health_points -= power
  end

  def dead?
    self.health_points <= 0
  end

end
