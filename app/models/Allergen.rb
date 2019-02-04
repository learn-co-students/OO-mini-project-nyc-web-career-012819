class Allergen

  attr_reader :ingredient, :user

  @@all = []

  # INSTANCE METHODS **********************************************

  def initialize(user, ingredient)
    @user, @ingredient = user, ingredient
    @@all << self
  end

  # CLASS METHODS **********************************************

  def self.all
    @@all
  end

  def self.reported_allergens
    @@all.map(&:ingredient)
  end

end
