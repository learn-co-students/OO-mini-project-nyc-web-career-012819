class RecipeCard
  @@all = []

attr_accessor :date, :rating, :user, :recipe

  def initialize(date, rating, user, recipe)
    @date = date
    @rating = rating
    @user = user
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end

  # def date
  #   self.date
  # end
  #
  # def rating
  #   self.rating
  # end
  #
  # def user
  #   self.user
  # end
  #
  # def recipe
  #   self.recipe
  # end
end
