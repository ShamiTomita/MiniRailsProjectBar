require 'rest-client'
require 'json'
require 'uri'

def get_cocktail
  response = []
  response_a = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a")
  response << response_a
  response_b = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=b")
  response << response_b
  response_c = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=c")
  response << response_c
  response_d = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=d")
  response << response_d
  response_f = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=f")
  response << response_f
  response_h = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=h")
  response << response_h
  response_l = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=l")
  response << response_l
  response_m = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=m")
  response << response_m
  response_n = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=n")
  response << response_n
  response_r = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=r")
  response << response_r
  response_s = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=s")
  response << response_s
  response_t = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=t")
  response << response_t

  response.each do |response|
    drink_array = JSON.parse(response)

    if !drink_array.nil?
      drink_array["drinks"].each do |cocktail|
        if cocktail["strAlcoholic"]== "Alcoholic"
          c = Cocktail.create(name: cocktail["strDrink"], image_url: cocktail["strDrinkThumb"])
            if !cocktail["strIngredient1"].nil? && cocktail["strIngredient1"] != ""
                ing1 = cocktail["strIngredient1"].titleize
                c.update(ingredient_1: ing1)
            end
            if !cocktail["strIngredient2"].nil? && cocktail["strIngredient2"] != ""
              ing2 = cocktail["strIngredient2"].titleize
              c.update(ingredient_2: ing2)
            end
            if !cocktail["strIngredient3"].nil? && cocktail["strIngredient3"] != ""
              ing3 = cocktail["strIngredient3"].titleize
              c.update(ingredient_3: ing3)
            end
            if !cocktail["strIngredient4"].nil? && cocktail["strIngredient4"] != ""
              ing4 = cocktail["strIngredient4"].titleize
              c.update(ingredient_4: ing4)
            end
            if !cocktail["strIngredient5"].nil? && cocktail["strIngredient5"] != ""
              ing5 = cocktail["strIngredient5"].titleize
              c.update(ingredient_5: ing5)
            end
        end

      end

    end

  end
end
