require 'pry'
require_relative '../config/environment.rb'


r1 = Recipe.new("ramen")
r2 = Recipe.new("steakneggs")
r3 = Recipe.new("pancakes")
r4 = Recipe.new("spaghetti and meatballs")
r5 = Recipe.new("pizza")

u1 = User.new("Rob")
u2 = User.new("Bri")
u3 = User.new("Bob")

rc1 = RecipeCard.new("card 1", u1, r1, 3)
rc2 = RecipeCard.new("card 2", u2, r2, 7)
rc3 = RecipeCard.new("card 3", u3, r3, 9)
rc4 = RecipeCard.new("card 4", u3, r1, 8)
rc5 = RecipeCard.new("card 5", u3, r2, 5)
rc6 = RecipeCard.new("card 6", u3, r4, 10)
rc7 = RecipeCard.new("card 7", u3, r5, 1)
rc8 = RecipeCard.new("card 8", u2, r1, 6)

i1 = Ingredient.new("noodles")
i2 = Ingredient.new("scallions")
i3 = Ingredient.new("eggs")
i4 = Ingredient.new("meat")
i5 = Ingredient.new("flour")
i6 = Ingredient.new("sauce")
i7 = Ingredient.new("cheese")
i8 = Ingredient.new("milk")
i9 = Ingredient.new("butter")

r1.add_ingredients([i1, i2, i3])
# RecipeIngredient.new(i1, r1)
# RecipeIngredient.new(i2, r1)
# RecipeIngredient.new(i3, r1)
# ri2 = RecipeIngredient.new([i1, i2, i3], r1)

a1 = Allergen.new("lactose", i8, u1)
a2 = Allergen.new("gluten", i5, u3)
a3 = Allergen.new("eggphobia", i3, u2)
a4 = Allergen.new("eggphobia", i3, u1)


binding.pry

puts "bye bye"
