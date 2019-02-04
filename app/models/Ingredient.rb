class Ingredient

  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    ingredient_allergen_hash = {}
    Allergen.all.each do |allergen|
      if ingredient_allergen_hash[allergen.ingredient.name]
        ingredient_allergen_hash[allergen.ingredient.name] += 1
      else
        ingredient_allergen_hash[allergen.ingredient.name] = 1
      end
    end
    most_common_allergen = ingredient_allergen_hash.key(ingredient_allergen_hash.values.max)
    Ingredient.all.find do |ingredient|
      ingredient.name == most_common_allergen
    end
  end

end
