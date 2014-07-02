class Robot

  def initialize
    @position = [0, 0]
    @items = []
    @health = 100
  end

  attr_accessor :equipped_weapon
  attr_accessor :health
  attr_reader :position
  attr_reader :items

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def items
    @items
  end

  def pick_up(item)
    if can_pick_up?(item)
      @items << item
      case item_type(item)
      when 'weapon'
        self.equipped_weapon = item
      when 'box_of_bolts'
        if should_feed?
          item.feed(self)
        end
      end
      return true
    else
      return false
    end

    # if can_pick_up?(item)
    #   @items << item
    #   if item.kind_of?(Weapon)
    #     self.equipped_weapon = item
    #   elsif item.kind_of?(BoxOfBolts)
    #     if should_feed?
    #       item.feed(self)
    #     end
    #   end
    #   return true
    # else
    #   return false
    # end
  end

  def item_type(item)
    case
    when item.kind_of?(Weapon)
      return 'weapon'
    when item.kind_of?(BoxOfBolts)
      return 'box_of_bolts'
    end
  end

  def should_feed?
    health <= 80
  end

  def can_pick_up?(item)
    (items_weight + item.weight) <= 250
  end

  def items_weight
    items_weight = 0
    @items.each do |item|
      items_weight += item.weight
    end
    items_weight
  end

  def wound(damage)
    if damage > @health
      @health = 0
    else
      @health -= damage
    end
  end

  def heal(points)
    if (@health + points) > 100
      @health = 100
    else
      @health += points
    end
  end

  def heal!(points)
    case
    when self.health <= 0
      raise 'Robot is dead already!'
    when (@health + points) > 100
       @health = 100
    else
       @health += points
    end
    # if self.health <= 0
    #   raise 'Robot is dead!'
    # end
    # if (@health + points) > 100
    #   @health = 100
    # else
    #   @health += points
    # end
  end

  def attack!(enemy)
    if !enemy.kind_of?(Robot)
      raise "Dude, you are hitting an inanimate object."
    end
    if can_attack?(enemy)
      if self.equipped_weapon != nil
        self.equipped_weapon.hit(enemy)
        if self.equipped_weapon.kind_of?(Grenade)
          self.equipped_weapon = nil
          @items.delete self.equipped_weapon
        end
      else
        enemy.wound(5)
      end 
    else
      return false
    end
  end

  def can_attack?(enemy)
    diff1 = (self.position[0] - enemy.position[0])
    diff2 = (self.position[1] - enemy.position[1])
    range = self.equipped_weapon ? self.equipped_weapon.range : 1
    if (diff1.abs > range) || (diff2.abs > range)
      return false
    else
      return true
    end
  end
end
