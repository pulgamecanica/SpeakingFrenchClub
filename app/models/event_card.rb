class EventCard < ApplicationRecord
  belongs_to :event
  belongs_to :card
end
