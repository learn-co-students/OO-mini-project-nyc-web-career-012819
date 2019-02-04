class User

  @@all = []

  attr_reader :user, :allergens

  def initialize(user)
    @user = user
    @@all << self
  end

  def allergens

  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(recipe, self, date, rating)
  end

  def my_recipes
    RecipeCard.all.select do |rc|
      rc.user == self
    end
  end

  def recipes
    self.my_recipes.map {|rc| rc.recipe}
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select do |aller|
      aller.user == self
    end.map {|aller| aller.ingredient}
  end

  def top_three_recipes
    my_recipe_arr = self.my_recipes
    my_ratings_arr = my_recipe_arr.map {|rec| rec.rating}.sort.reverse
    @top_three_recipes = []

    @first_highest_rating = my_ratings_arr[0]
    @second_highest_rating = my_ratings_arr[1]
    @third_highest_rating = my_ratings_arr[2]

    @top_three_recipes << my_recipe_arr.find {|rc| rc.rating == @first_highest_rating}.recipe
    @top_three_recipes << my_recipe_arr.find {|rc| rc.rating == @second_highest_rating}.recipe
    @top_three_recipes << my_recipe_arr.find {|rc| rc.rating == @third_highest_rating}.recipe


    @top_three_recipes
  end

  def most_recent_recipe
    RecipeCard.all.last.recipe
  end

  def self.all
    @@all
  end

  def safe_recipes
    # a = x & y

    rec_ing_arr = RecipeIngredient.all.map {|rec_ing| rec_ing.ingredient}
    my_allergen_arr = self.allergens

    not_allergic_ingredients = rec_ing_arr - my_allergen_arr

    # binding.pry

    @safe_recipes_arr = []

    RecipeIngredient.all.each do |rec_ing|
      not_allergic_ingredients.each do |allg_ing|
        # binding.pry
        if rec_ing.ingredient == allg_ing
          @safe_recipes_arr << rec_ing.recipe
        end
      end
    end

    @safe_recipes_arr

  end



end
