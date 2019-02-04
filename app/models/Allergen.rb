class Allergen

  attr_reader :name, :ingredient, :user

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, ingredient, user)
    @name = name
    @ingredient = ingredient
    @user = user


    @@all << self
  end









end
