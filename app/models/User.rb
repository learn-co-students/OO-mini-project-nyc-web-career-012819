class User

  attr_accessor :name, :allergen

  @@all = []

  def initialize(name)
    @name = name
    @allergen = allergen

    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select do |rc|
      rc.user == self
    end
  end

  def recipes
    self.recipe_cards.map do |rc|
      rc.recipe
    end
  end

  def add_recipe_card(title, user, recipe, rating)
    RecipeCard.new(title, self, recipe, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(ingredient, self)
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.user == self
    end 
  end

  def top_three_recipes
    rated_recipes = self.recipe_cards.sort_by do |rc|
      rc.rating
    end
    top_rated = rated_recipes.map do |rc|
      rc.recipe
    end
    top_rated.last(3)
  end

  def most_recent_recipe
    self.recipe_cards.last
  end











end
