class CardTranslation < ApplicationRecord
  belongs_to :card
  belongs_to :lang
end
