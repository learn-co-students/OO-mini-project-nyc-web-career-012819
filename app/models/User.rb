class User

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipes
    recipe_cards.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def recipe_cards
    my_recipe_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
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
    end
  end

  def top_three_recipes
    sorted = recipe_cards.sort_by do |recipe_card|
      -recipe_card.rating
    end
    sorted[0,3].map do |recipe_card|
      recipe_card.recipe
    end
  end

  def most_recent_recipe
    recipes.last
  end

  def safe_recipes
    recipes.select do |recipe|
      !am_i_allergic?(recipe)
    end
  end

  def am_i_allergic?(recipe)
    allergic_ingredients = allergens.map do |allergen|
      allergen.ingredient
    end

    found_ingredient = allergic_ingredients.find do |ingredient|
      recipe.ingredients.include? (ingredient)
    end

    !!found_ingredient
  end

  def self.all
    @@all
  end

end #end of User class
