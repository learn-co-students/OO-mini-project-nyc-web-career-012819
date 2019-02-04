class RecipeCard

  attr_reader :date, :recipe, :user
  attr_accessor :rating

  @@all = []

  def self.all
    @@all
  end

  def initialize(date, recipe, user, rating)
    @rating = rating
    @date = date
    @recipe = recipe
    @user = user
    @@all << self
  end

end