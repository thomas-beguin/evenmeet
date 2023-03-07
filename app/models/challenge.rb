class Challenge < ApplicationRecord
  belongs_to :reward
  belongs_to :relationship
  enum :status, { pending: 0, accepted: 1, refused: 2 }
end
