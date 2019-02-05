class User
  @@all = []

  attr_accessor :user, :recipes


  def initialize(user)
    @user = user
    @recipes = []
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    self.recipes = RecipeCard.all.select do |rec|
                    rec.user == self.user
                  end
  end
  # binding.pry

  def add_recipe_card(recipe, date, rating)
    new_rec = RecipeCard.new(date, rating, self.user, recipe)
    new_rec
  end

  def declare_allergen(ingredient)
    na = Allergen.new(ingredient)
    na.user = self.user
    na
  end

  def allergens
    allergies  =[]
    Allergen.all.select do |aller|
      if aller.user == self.user
        allergies << aller.ingredient
      end
    end
    allergies
  end

  def top_three_recipes
    # binding.pry
    rec = self.recipes.sort_by do |r|
      r.rating
    end
    rec.reverse[0..2]
  end

  def most_recent_recipe
    rec = self.recipes.sort_by do |r|
      r.date
  end
  rec[-1]
end





end
