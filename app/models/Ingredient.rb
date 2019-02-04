class Ingredient

  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name

    @@all << self
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.ingredient == self
    end
  end

  def users
    self.allergens.map do |allergen|
      allergen.user
    end
  end

  def self.most_common_allergen
    self.all.max_by do |ingredient, length|
      ingredient.users.length
    end
  end



end
