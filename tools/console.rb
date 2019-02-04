require_relative '../config/environment.rb'

pizza = Recipe.new("pizza")
sushi = Recipe.new("sushi")
noodle = Recipe.new("noodle")
halal = Recipe.new("halal")


nate = User.new("Nate")
dana = User.new("Dana")

sauce = Ingredient.new('sauce')
cheese = Ingredient.new('cheese')
dough = Ingredient.new('dough')
flour = Ingredient.new('flour')

nateRecipe1 = RecipeCard.new(pizza, nate, "2000", 10)
nateRecipe2 = RecipeCard.new(sushi, nate, "2001", 9)
nateRecipe3 = RecipeCard.new(noodle, nate, "2002", 8)
nateRecipe4 = RecipeCard.new(halal, nate, "2003", 7)

pizzaSauce = RecipeIngredient.new(pizza, sauce)
pizzaCheese = RecipeIngredient.new(pizza, cheese)
pizzaDough = RecipeIngredient.new(pizza, dough)
noodleSauce = RecipeIngredient.new(noodle, flour)

dana.declare_allergen(cheese)
dana.declare_allergen(dough)
dana.declare_allergen(sauce)
nate.declare_allergen(cheese)




binding.pry
