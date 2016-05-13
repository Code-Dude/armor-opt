class Armor
  attr_accessor :name, :armorb, :maxac, :acpenalty, :spellfail

  def initialize(name, stats)
    @name = name
    @armorb = stats["armor"]
    @maxdex = stats["maxac"]
    @acpenalty = stats["acpenalty"]
    @spellfail = stats["spellfail"]
    @armortype = stats["armor_type"]
  end

  def rating
    @armorb + @maxdex
  end

  def check_rating
    @armorb + @maxdex + @acpenalty
  end

  def arcane_rating
    (@armorb + @maxdex + @acpenalty) * @spellfail
  end
end