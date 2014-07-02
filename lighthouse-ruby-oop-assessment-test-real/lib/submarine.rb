class Submarine

  def initialize
    @depth = 0
    @tile = 0
    @cargo = []
    @total_revenue = 0
  end

  attr_accessor :depth
  attr_accessor :tile
  attr_accessor :cargo
  attr_accessor :total_revenue

  def dive!
    if at_surface?
      @depth += 1
    end
  end

  def surface
    if right_below_surface?
      @depth = Ocean::SURFACE
    end
  end

  def descend
    if (depth > Ocean::SURFACE && depth < Ocean::MAX_DEPTH)
      @depth += 1
    end
  end

  def ascend
    if depth > 1
      @depth -= 1
    end
  end

  def forward
    if tile < Ocean::MAX_TILE
      @tile += 1
    end
  end

  def backward
    if tile > Ocean::MIN_TILE
      @tile -= 1
    end
  end

  def fish
    if depth > Ocean::SURFACE
      cargo << Ocean.fish(depth, tile)
    end
  end

  def at_surface?
    depth == Ocean::SURFACE
  end

  def right_below_surface?
    depth == (Ocean::SURFACE + 1)
  end

  def sell_cargo
    if at_surface?
      sum_fish_value
      cargo.clear
      return true
    else
      return false
    end
  end

  def sum_fish_value
    cargo.each do |f|
      @total_revenue += (f.value_per_kg * f.weight)
    end
  end

end