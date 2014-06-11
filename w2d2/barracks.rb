class Barracks
  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end

  attr_reader :gold
  attr_reader :food
  attr_reader :health_points
  attr_reader :lumber


  def damage(power)
    @health_points = ( health_points - power )
  end

  def train_footman
    @gold -= 135
    @food -= 2
    if can_train_footman?
      footman = Footman.new
    else
      return nil
    end
  end

  def can_train_footman?
    gold >= 135 && food >= 2
  end

  def train_peasant
    @gold -= 90
    @food -= 5
    if can_train_peasant?
      peasant = Peasant.new
    else
      return nil
    end
  end

  def can_train_peasant?
    gold >= 90 && food >= 5
  end


  def train_seige_engine
    @gold -= 200
    @food -= 3
    @lumber -= 60
    seige_engine = SeigeEngine.new 
  end

  def dead?
    self.health_points <= 0
  end
end
