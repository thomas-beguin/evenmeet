class RewardChoice < ApplicationRecord
  belongs_to :participation
  belongs_to :reward
  enum :status, { non_accepted: 0, accepted: 1 }
end
