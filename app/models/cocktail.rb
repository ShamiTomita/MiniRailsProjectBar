
require 'open-uri'
class Cocktail < ApplicationRecord
  has_one_attached :image
  #before_validation :attach_image

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
end
