
class Ingredient
  @@all = []

  attr_reader :ingredient

  def initialize(ingredient)
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    allergen_hash = {}
    Allergen.all.each do |allergen|
      if allergen_hash[allergen.ingredient]
        allergen_hash[allergen.ingredient] += 1
      else
        allergen_hash[allergen.ingredient] = 1
      end
    end
    allergen_hash.keys.max_by {|ing| allergen_hash[ing]}
  end

end
