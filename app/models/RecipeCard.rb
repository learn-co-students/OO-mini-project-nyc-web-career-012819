class RecipeCard

  attr_accessor :user, :recipe, :date, :rating

  @@all = []

  def initialize(user, recipe, rating, date)
    @user = user
    @recipe = recipe
    @@all << self
    @date = date
    @rating = rating
  end

  def self.all
      @@all
  end

end
