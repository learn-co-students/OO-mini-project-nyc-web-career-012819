require 'pry'

class Recipe

  attr_accessor :name
  attr_reader :ingredient

  @@all = []

  def initialize(name)
    @name = name
    @ingredient = []
    @@all << self
  end

  def ingredient= (ingredient)
    @ingredient << ingredient
  end

  def self.all
    @@all
  end

  def recipe_cards
    lists = RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
  end

  def recipe_ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
  end

  def self.most_popular
    recipe_hash = {}
    RecipeCard.all.each do |recipe_card|
      if recipe_hash[recipe_card.recipe.name]
        recipe_hash[recipe_card.recipe.name] += 1
      else
        recipe_hash[recipe_card.recipe.name] = 1
      end
    end
    most_popular_recipe_name = recipe_hash.key(recipe_hash.values.max)
    Recipe.all.find do |recipe|
      recipe.name == most_popular_recipe_name
    end
  end


  def users
    self.recipe_cards.map do |recipe_card|
      recipe_card.user
    end
  end

  def ingredients
    self.recipe_ingredients.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end
  end

  def allergens
    allergen = Allergen.all.select do |allergen|
      self.ingredients.include?(allergen.ingredient)
    end
    allergen.map do |aller|
      aller.ingredient
    end
  end

  def add_ingredients(ingredient)
    RecipeIngredient.new(self, ingredient)
  end

end
