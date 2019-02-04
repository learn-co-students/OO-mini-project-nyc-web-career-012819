require_relative '../config/environment.rb'


# RECIPES
pizza = Recipe.new("pizza")
lasagna = Recipe.new("lasagna")
tabbouleh = Recipe.new("tabbouleh")
polo = Recipe.new("polo")

# USERS
akram = User.new("akram")
camille = User.new("camille")
liza = User.new("liza")

akram.add_recipe_card(pizza, Time.now, 4)
akram.add_recipe_card(polo, Time.now, 3)
camille.add_recipe_card(pizza, Time.now, 2)
camille.add_recipe_card(pizza, Time.now, 2)

 # INGREDIENTS
dough = Ingredient.new("dough")
peperoni = Ingredient.new("peperoni")

olive = Ingredient.new("olive")
tomato = Ingredient.new("tomato")

cucumber = Ingredient.new("cucumber")
mint = Ingredient.new("mint")

pizza.users

# binding.pry
