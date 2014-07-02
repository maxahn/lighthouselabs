class Item

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  attr_reader :name
  attr_reader :weight

end