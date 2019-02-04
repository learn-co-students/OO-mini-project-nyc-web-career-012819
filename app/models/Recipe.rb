class Recipe

  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def self.most_popular
    most_popular_recipe = @@all[0]
    i = 1
    while i < @@all.length
      if @@all[i].users.count > most_popular_recipe.users.count
        most_popular_recipe = @@all[i]
      end
      i += 1
    end
    most_popular_recipe
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipecards
    RecipeCard.all.select do |recipecard|
      recipecard.recipe == self
    end
  end

  def users
    self.recipecards.map do |recipecard|
      recipecard.user
    end
  end

  def recipeingredients
    RecipeIngredient.all.select do |recipeingredient|
      recipeingredient.recipe == self
    end
  end

  def ingredients
    self.recipeingredients.map do |recipeingredient|
      recipeingredient.ingredient
    end
  end

  def allergens
    allergen_array = []
    self.ingredients.each do |ingredient|
      if ingredient.allergens.count > 0
        allergen_array << ingredient
      end
    end
    allergen_array
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

end