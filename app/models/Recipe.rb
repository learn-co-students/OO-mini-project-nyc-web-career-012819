class Recipe

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    array = self.all.sort_by do |recipe|
      recipe.users.length
    end
    array.last
  end

  def recipe_cards
    RecipeCard.all.select do |rc|
      rc.recipe == self
    end
  end

  def users
    recipe_cards.map do |rc|
      rc.user
    end
  end

  def recipe_ingredients
    RecipeIngredient.all.select do |ri|
      ri.recipe == self
    end
  end

  def ingredients
    recipe_ingredients.map do |ri|
      ri.ingredient
    end
  end

  def allergens
    self.ingredients.select do |ingredient|
      check_ingredient(ingredient)
    end
  end

    def check_ingredient(ingredient)
      result = Allergen.all.find do |allergen|
        allergen.ingredient == ingredient
      end

      if result
        true
      else
        false
      end
    end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(ingredient, self)
    end
  end

end
