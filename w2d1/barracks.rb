class Barracks
  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    @gold = 1000
    @food = 80
  end

  attr_accessor :gold
  attr_accessor :food

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

end
