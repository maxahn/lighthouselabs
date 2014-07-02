class Weapon < Item

  def initialize(name, weight, damage)
    super(name, weight)
    @damage = damage
    @range = 1
  end

  attr_reader :range
  attr_reader :damage

  def hit(robot)
    robot.wound(@damage)
  end

end