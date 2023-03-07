class RewardChoice < ApplicationRecord
  belongs_to :participation
  belongs_to :reward
end
