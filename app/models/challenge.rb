class Challenge < ApplicationRecord
  belongs_to :reward
  belongs_to :relationship
  has_many :messages, dependent: :destroy
  enum :status, { pending: 0, won: 1, failed: 2 }
  enum :read,   { new_message: 0, read: 1 }
end
