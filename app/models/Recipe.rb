class Recipe

  @@all = []

  attr_reader :recipe

  def initialize(recipe)
    @recipe = recipe
    @@all << self
  end

  def users
    RecipeCard.all.select do |rc|
      rc.recipe == self
    end.map {|recipe| recipe.user}
  end

  def ingredients
    RecipeIngredient.all.select do |ri|
      ri.recipe == self
    end.map {|ri| ri.ingredient}
  end

  def add_ingredients(ingredient_arr)
    # [cheese, dough]
    ingredient_arr.each do |ing|
      RecipeIngredient.new(self, ing)
    end
  end

  def self.all
    @@all
  end


end
