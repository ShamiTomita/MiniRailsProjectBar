require 'open-uri'
class Cocktail < ApplicationRecord
  has_one_attached :image
  has_many :drinks
  has_many :users, :through => :drinks

  def attach_image
    if !self.image_url.nil?
      filename = File.basename(URI.parse(self.image_url).path)
      file = URI.open(self.image_url)
      self.image.attach(io: file, filename: filename, content_type: 'image/jpg')
    end
  end

  def ingredients
    ing = []
    if !self.ingredient_1.nil?
      ing << self.ingredient_1
    end
    if !self.ingredient_2.nil?
      ing << self.ingredient_2
    end
    if !self.ingredient_3.nil?
      ing << self.ingredient_3
    end
    if !self.ingredient_4.nil?
      ing << self.ingredient_4
    end
    if !self.ingredient_5.nil?
      ing << self.ingredient_5
    end
    ing.compact
  end

  def self.all_ingredients
    all_ing = []
    cocktails = Cocktail.all
    cocktails.each do |cocktail|
      cocktail.ingredients.each do |ing|
        ing.titleize
        all_ing << ing
      end
    end
    all_ing = all_ing.flatten
    all_ing = all_ing.uniq
    sorted = all_ing.sort
    sorted
  end
end
