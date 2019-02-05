class Recipe
  @@all = []
attr_accessor :recipe, :user, :ingredients

  def initialize(recipe)
    @recipe = recipe
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    hash = {}
    RecipeCard.all.each do |rec|
      hash[rec.recipe] = 0
    end
    RecipeCard.all.each do |rec|
      hash[rec.recipe] += 1
    end
    hash.values.sort do |r, c|
      c
    end
    popular = hash.first
    popular[0]
  end

  def users
    use = RecipeCard.all.select do |rc|
      rc.recipe == self.recipe
    end
    use.map do |re|
      re.user
    end
  end

  def ingredients
    array = []
    RecipeIngredient.all.select do |ri|
      ri.recipe == self.recipe
      array << ri.ingredient.ingredient
    end
    array
  end

  def allergens
       Allergen.all.map do |allergy|
            allergy.allergen
          end.select do |aller|
        self.ingredients.include?(aller)
    end
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end


end
