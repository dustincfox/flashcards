class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds

  validates :name, uniqueness: true, presence: true, length: {maximum: 15}, format: /\A[ 0-9a-z]+\z/i

end
