class Challenge < ApplicationRecord
  belongs_to :reward
  belongs_to :relationship
  has_many :messages
  enum :status, { pending: 0, accepted: 1, refused: 2 }
  enum :read,   { new_message: 0, read: 1 }
end
