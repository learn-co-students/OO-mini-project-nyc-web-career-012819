class Ingredient

  attr_reader :name

  @@all = []

  # INSTANCE METHODS **********************************************

  def initialize(name)
    @name = name
    @@all << self
  end

  # CLASS METHODS **********************************************

  def self.all
    @@all
  end

  def self.most_common_allergen
    frequency_table = Allergen.reported_allergens.inject( {} ) do |hash, ingredient|
	      hash[ingredient] == nil ? hash[ingredient] = 1 : hash[ingredient] += 1
	      hash
	    end

    frequency_table.max_by { |ingredient, frequency| frequency }.first
  end

end
