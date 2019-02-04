class Recipe

  attr_reader :name

  @@all = []

  # INSTANCE METHODS **********************************************

  def initialize(name)
    @name = name
    @@all << self
  end

  def users
    recipe_cards.map(&:user)
  end

  def ingredients
    recipe_ingredients.map(&:ingredient)
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each { |ingredient| RecipeIngredient.new(self, ingredient) }
  end

  def allergens
    ingredients.select { |ingredient| Allergen.reported_allergens.include?(ingredient) }
  end

  # CLASS METHODS **********************************************

  def self.all
    @@all
  end

  def self.most_popular
    frequency_table = RecipeCard.all.inject( {} ) do |hash, recipe_card|
        hash[recipe_card.recipe] == nil ? hash[recipe_card.recipe] = 1 : hash[recipe_card.recipe] += 1
        hash
      end

    frequency_table.max_by { |recipe, frequency| frequency }.first
  end


  # PRIVATE METHODS **********************************************

  private

  def recipe_cards
    RecipeCard.all.select { |recipe_card| recipe_card.recipe == self }
  end

  def recipe_ingredients
    RecipeIngredient.all.select { |recipe_ingredient| recipe_ingredient.recipe == self }
  end

end #end of class Recipe
