require_relative '../config/environment.rb'
require_relative '../app/models/Allergen.rb'
require_relative '../app/models/Ingredient.rb'
require_relative '../app/models/Recipe.rb'
require_relative '../app/models/RecipeCard.rb'
require_relative '../app/models/RecipeIngredient.rb'
require_relative '../app/models/User.rb'


Elizabeth = User.new("Elizabeth")
Dolma = User.new("Dolma")
Tomato = Ingredient.new("Tomato")
Potato = Ingredient.new("Potato")
Onion = Ingredient.new("Onion")
Oregano = Ingredient.new("Oregano")
Jalepeono = Ingredient.new("Jalepeono")
Beans = Ingredient.new("Beans")
Cheese = Ingredient.new("Cheese")
Noodle = Ingredient.new("Noodle")
Tomato_sauce = Recipe.new("Tomato_sauce")
Pizza = Recipe.new("Pizza")
Pasta = Recipe.new("Pasta")
# Tomato_sauce.ingredient = Tomato
# Tomato_sauce.ingredient = Potato
Chili = Recipe.new("Chili")
# Chili.ingredient = Beans
# Chili.ingredient = Jalepeono
# Chili.ingredient = Tomato

Elizabeth.add_recipe_card(Tomato_sauce, "02/04/2019", 10)
Dolma.add_recipe_card(Chili, "02/04/2019", 10)
Elizabeth.add_recipe_card(Chili, "02/04/2019", 10)
Elizabeth.add_recipe_card(Pizza, "02/06", 7)
Elizabeth.add_recipe_card(Pasta, "02/28", 6)

Re_ing1 = RecipeIngredient.new(Chili, Beans)
Re_ing2 = RecipeIngredient.new(Chili, Jalepeono)
Re_ing4 = RecipeIngredient.new(Chili, Tomato)
Re_ing3 = RecipeIngredient.new(Tomato_sauce, Tomato)
Re_ing5 = RecipeIngredient.new(Pizza, Tomato)
Re_ing6= RecipeIngredient.new(Pizza, Cheese)
Re_ing7 = RecipeIngredient.new(Pizza, Jalepeono)
Re_ing8= RecipeIngredient.new(Pasta, Cheese)
Re_ing9 = RecipeIngredient.new(Pasta, Tomato)
Re_ing10 = RecipeIngredient.new(Pasta, Noodle)

All_ing1 = Allergen.new(Elizabeth, Jalepeono)
All_ing2 = Allergen.new(Dolma, Tomato)
All_ing3 = Allergen.new(Elizabeth, Tomato)


binding.pry
