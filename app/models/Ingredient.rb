class Ingredient

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen

    frequency_table = Allergen.reported_allergens.inject( {} ) do |hash, ingredient|
      hash[ingredient] == nil ? hash[ingredient] = 1 : hash[ingredient] += 1
      hash
    end

    top = frequency_table.max_by do |ingredient, frequency|
      frequency
    end

    top.first
  end


end
