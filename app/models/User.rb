class User

  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipecards
    RecipeCard.all.select do |recipecard|
      recipecard.user == self
    end
  end

  def recipes
    self.recipecards.map do |recipecard|
      recipecard.recipe
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(date, recipe, self, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.user == self
    end
  end

  def ingredients
    self.allergens.map do |allergen|
      allergen.ingredient
    end
  end

  def top_three_recipes
    sorted_recipes = self.recipecards.sort_by do |recipecard|
      recipecard.rating
    end
    recipe_array = sorted_recipes.map do |recipecard|
      recipecard.recipe
    end
    recipe_array[0..2]
  end


  def most_recent_recipe
    recipecard_array = self.recipecards.map do |recipecards|
      recipecards.date
    end
    oldest_date = recipecard_array.sort[-1]
    most_recent_recipecard = self.recipecards.find do |recipecards|
      recipecards.date == oldest_date
    end
    most_recent_recipecard.recipe
  end


end