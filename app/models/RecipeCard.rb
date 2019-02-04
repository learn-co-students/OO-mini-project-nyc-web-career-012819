class RecipeCard

  attr_reader :user, :recipe, :date, :rating

  @@all = []

  # INSTANCE METHODS **********************************************

  def initialize(user, recipe, date, rating)
    @user, @recipe, @date, @rating = user, recipe, date, rating
    @@all << self
  end

  # CLASS METHODS **********************************************

  def self.all
    @@all
  end

end
