require "pry"
class User

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    recipe_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
    recipe_cards.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.user == self
    end.map do |list|
      list.ingredient
    end
  end

  def top_three_recipes
    # get all the recipe_cards
    my_card = RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
    # sort by the rating # take the top 3
    sorted_card = my_card.sort_by do |card|
      card.rating
    end.last(3)
    #  Array of 3 RecipeCard objects

    # return 3 Recipe objects
    sorted_card.map do |card|
      card.recipe
    end
  end

  def most_recent_recipe
    RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end.last.recipe
  end

  def safe_recipes
    self.recipes.reject do |recipe|
      recipe.ingredients.any? do |ingredient|
        allergens.include?(ingredient)
      end
    end
  end


end
