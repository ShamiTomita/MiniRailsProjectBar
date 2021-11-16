class CreateCocktails < ActiveRecord::Migration[6.1]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :ingredient_1
      t.string :ingredient_2
      t.string :ingredient_3
      t.string :ingredient_4
      t.string :ingredient_5
      t.string :image_url
      t.timestamps
    end
  end
end
