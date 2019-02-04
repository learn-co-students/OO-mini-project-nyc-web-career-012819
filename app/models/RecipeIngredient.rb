class RecipeIngredient

  attr_reader :recipe, :ingredient

  @@all = []

  # INSTANCE METHODS **********************************************

  def initialize(recipe, ingredient)
    @recipe, @ingredient = recipe, ingredient
    @@all << self
  end

  # CLASS METHODS **********************************************

  def self.all
    @@all
  end

end
