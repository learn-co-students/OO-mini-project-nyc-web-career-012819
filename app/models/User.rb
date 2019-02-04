class User

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all << self
  end

  def recipes
    RecipeCard.all.select{|recipe_card| recipe_card.user == self}
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, rating, date)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select {|allergen| allergen.user == self }
  end

  # def top_three_recipes
  #   RecipeCard.all.
  # end

end
