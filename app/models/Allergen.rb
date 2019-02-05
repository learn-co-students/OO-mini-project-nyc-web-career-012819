class Allergen
  @@all = []

  attr_accessor :allergen, :user

  def initialize(allergen)
    @allergen = allergen
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end
end
