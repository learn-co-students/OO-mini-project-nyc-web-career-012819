class Recipe

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def users
    my_recipe_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end

    my_recipe_cards.map do |recipe_card|
      recipe_card.user
    end
  end

  def ingredients
    my_recipe_ingredients = RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end

    my_recipe_ingredients.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def self.most_popular
    frequency_table = RecipeCard.all.inject( {} ) do |hash, recipecard|
      recipe = recipecard.recipe
      hash[recipe] == nil ? hash[recipe] = 1 : hash[recipe] += 1
      hash
    end

    most_popular_item = frequency_table.max_by do |recipe, frequency|
      frequency
    end

    most_popular_item.first
  end

  def allergens
    ingredients.select do |ingredient|
      Allergen.reported_allergens.include?(ingredient)
    end
  end

  def self.all
    @@all
  end

end #end of class Recipe
