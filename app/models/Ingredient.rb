class Ingredient
  @@all = []

attr_accessor :ingredient

  def initialize(ingredient)
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    all_count = {}
    Allergen.all.each do |allergy|
      all_count[allergy.allergen] = 0
    end
    Allergen.all.each do |allergy|
      all_count[allergy.allergen] += 1
    end
  all_count.max_by do |allergy, count|
    count
  end[0]
  end
end
