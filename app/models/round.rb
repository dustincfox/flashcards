class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :guesses

  validates :user_id, presence: true
  validates :deck_id, presence: true

end
