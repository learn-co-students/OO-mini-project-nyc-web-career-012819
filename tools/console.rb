require_relative '../config/environment.rb'

def today
  Time.now.to_s[0..9]
end

ethan = User.new("ethan")
cynthia = User.new("cynthia")
yuri = User.new("yuri")

pizza = Recipe.new("pizza")
bread = Recipe.new("bread")
strawberry_jam = Recipe.new("strawberry jam")
salad = Recipe.new("salad")

cheese = Ingredient.new("cheese")
tomato = Ingredient.new("tomato")
yeast = Ingredient.new("yeast")
flour = Ingredient.new("flour")
strawberry = Ingredient.new("strawberry")
pectin = Ingredient.new("pectin")
lettuce = Ingredient.new("lettuce")

pizza.add_ingredients([cheese, tomato, yeast, flour])
bread.add_ingredients([yeast, flour])
strawberry_jam.add_ingredients([strawberry, pectin])
salad.add_ingredients([lettuce, tomato])

yuri.declare_allergen(strawberry)
yuri.declare_allergen(cheese)
ethan.declare_allergen(flour)
cynthia.declare_allergen(cheese)

ethan.add_recipe_card(pizza, today, 2)
cynthia.add_recipe_card(bread, today, 1)
ethan.add_recipe_card(strawberry_jam, today, 3)
cynthia.add_recipe_card(strawberry_jam, today, 5)
cynthia.add_recipe_card(salad, today, 3)
cynthia.add_recipe_card(pizza, today, 4)
yuri.add_recipe_card(pizza, today, 4)
yuri.add_recipe_card(salad, today, 4)

binding.pry