class RewardChoice < ApplicationRecord
  belongs_to :participation
  belongs_to :reward
  enum :status, { pending: 0, accepted: 1, refused: 2 }
end
