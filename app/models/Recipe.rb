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
    recipe_count = {}
    recipe_array = RecipeCard.all.map{|recipe_card| recipe_card.recipe.name}
    recipe_array.each do |recipe|
      if recipe_count.keys.include?(recipe)
        recipe_count[recipe] += 1
      else
        recipe_count[recipe] = 1
      end
    end
    recipe_count.max_by{|recipe, count| count}.first
  end

  def users
    # binding.pry
    recipe_object_array = RecipeCard.all.select {|recipe_ingredients| recipe_ingredients.recipe == self}
    recipe_object_array.map{|recipe_ingredient| recipe_ingredient.user}.uniq
  end

  def ingredients
    RecipeIngredient.all.map {|recipe_ingredient| recipe_ingredient.ingredient }
  end

  def allergens
    allergens = []
    self.ingredients.each{ |ingredientz|
      Allergen.all.each{|allergen|
        # binding.pry
        if allergen.ingredient == ingredientz
          allergens << ingredientz
        end } }
        allergens
  end

  def add_ingredients(array_of_ingredients)
    array_of_ingredients.map{|ingredient| RecipeIngredient.new(self, ingredient)}
  end

end
