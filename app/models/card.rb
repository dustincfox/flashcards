class Card < ActiveRecord::Base
  belongs_to :deck

  validates :deck_id, presence: true
  validates :question, presence: true
  validates :answer, presence: true
  
end
