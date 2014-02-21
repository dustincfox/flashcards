class User < ActiveRecord::Base
  has_many :rounds
  has_many :decks, through: :rounds

  validates :username, length: {maximum: 10}, uniqueness: true, presence: true, format: /\A[ 0-9a-z]+\z/i
  validates :password, length: {maximum: 12}
end
