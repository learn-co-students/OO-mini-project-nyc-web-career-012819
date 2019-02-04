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

chocolate = Ingredient.new("chocolate")
milk = Ingredient.new("milk")
caramel = Ingredient.new("caramel")

akram.declare_allergen(mint)
camille.declare_allergen(milk)
akram.declare_allergen(chocolate)
camille.declare_allergen(chocolate)
liza.declare_allergen(chocolate)


# pizza.users

recipe_ingredient_1 = RecipeIngredient.new(pizza, dough)
recipe_ingredient_2 = RecipeIngredient.new(pizza, olive)
pizza.add_ingredients([tomato, peperoni, mint])


# pizza.allergens
binding.pry
