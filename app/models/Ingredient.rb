class Ingredient

  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def self.most_common_allergen
    most_cmn_allrgn = @@all[0]
    i = 1
    while i < @@all.length
      if @@all[i].users.count > most_cmn_allrgn.users.count
        most_cmn_allrgn = @@all[i]
      end
      i += 1
    end
    most_cmn_allrgn
  end


  def initialize(name)
    @name = name
    @@all << self
  end

  def recipeingredients
    RecipeIngredient.all.select do |recipeingredient|
      recipeingredient.ingredient == self
    end
  end

  def recipes
    self.recipeingredients.map do |recipeingredient|
      recipeingredient.recipe
    end
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.ingredient == self
    end
  end

  def users
    self.allergens.map do |allergen|
      allergen.user
    end
  end

end