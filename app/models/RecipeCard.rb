class RecipeCard

  attr_reader :title, :user, :recipe, :date
  attr_accessor :rating

  @@all = []

  def initialize(title, user, recipe, rating)
    @title = title
    @user = user
    @recipe = recipe
    @date = Time.now
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
