class Drink < ApplicationRecord
  belongs_to :user, :cocktail
  def user
    u = User.find_by(id: self.user_id)
    u.name
  end
end
