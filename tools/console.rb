require_relative '../config/environment.rb'



user1 = User.new("A")

recipe1 = Recipe.new("applesauce")


recipe_card1 = RecipeCard.new("01/02/19", 5, "A", "berrysauce")
recipe_card2 = RecipeCard.new("01/03/19", 2, "A", "berrysauce")
recipe_card3 = RecipeCard.new("02/02/19", 3, "B", "berrysauce")
recipe_card4 = RecipeCard.new("01/19/19", 6, "A", "rasberrysauce")
recipe_card5 = RecipeCard.new("01/28/19", 8, "C", "applesauce")


allergy1 = Allergen.new("banana")
allergy1.user = "A"
allergy2 = Allergen.new("grape")
allergy3 = Allergen.new("grape")
allergy4 = Allergen.new("grape")

ingredient1 = Ingredient.new("apples")
ingredient2 = Ingredient.new("cinnamon")
ingredient3 = Ingredient.new("grape")

ring1 = RecipeIngredient.new(ingredient1, "applesause")
ring2 = RecipeIngredient.new(ingredient2, "applesause")
ring3 = RecipeIngredient.new(ingredient3, "applesause")



binding.pry
