class Allergen
  attr_accessor :ingredient, :user
  @@all = []

  def initialize(user, ingredient)
    @@all << self
    @ingredient = ingredient
    @user = user
  end

  def self.all
    @@all
  end


end
