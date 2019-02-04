class User

  attr_reader :name

  @@all = []

  # INSTANCE METHODS **********************************************

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipes
    recipe_cards.map(&:recipe)
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select { |allergen| allergen.user == self }.map(&:ingredient)
  end

  def top_three_recipes
    sorted = recipe_cards.sort_by { |recipe_card| -recipe_card.rating }
    sorted[0,3].map(&:recipe)
  end

  def most_recent_recipe
    recipes.last
  end

  def safe_recipes
    recipes.select { |recipe| !allergic_to?(recipe) }
  end

  def allergic_to?(recipe)
    result = allergens.find { |ingredient| recipe.ingredients.include? (ingredient) }
    result ? true : false
  end

  # CLASS METHODS **********************************************

  def self.all
    @@all
  end

  # PRIVATE METHODS **********************************************

  private

  def recipe_cards
    RecipeCard.all.select { |recipe_card| recipe_card.user == self }
  end

end #end of User class
