class Card < ApplicationRecord
  has_many :card_translations, dependent: :destroy
  has_many :phrases, dependent: :destroy
  has_many :events, through: :event_card
end
