class Ingredient

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    allergen_count = {}
    allergen_array = Allergen.all.map{|allergen| allergen.ingredient}
    allergen_array.each do |allergen|
      if allergen_count.keys.include?(allergen)
        allergen_count[allergen] += 1
      else
        allergen_count[allergen] = 1
      end
    end
    allergen_count.max_by{|allergen, count| count}.first
  end

end
