class User < ApplicationRecord
  has_secure_password
  has_many :drinks
  has_many :cocktails, :through => :drinks
  validates :name, presence: true
  validates :name, uniqueness: true

  def drinks_had
    self.drinks.count
  end
end
