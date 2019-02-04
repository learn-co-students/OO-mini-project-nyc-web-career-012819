class Allergen

  attr_reader :ingredient, :user

  @@all = []

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end


  def self.reported_allergens
    @@all.map do |allergen|
      allergen.ingredient
    end
  end

end
