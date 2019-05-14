Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

json_raw = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
           .read
ingredients = JSON.parse(json_raw)["drinks"]
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end
