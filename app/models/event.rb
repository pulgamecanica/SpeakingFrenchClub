class Event < ApplicationRecord
  has_many :cards, through: :event_card
  has_many :users, through: :subscription
end
