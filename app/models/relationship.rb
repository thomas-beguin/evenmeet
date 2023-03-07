class Relationship < ApplicationRecord
  belongs_to :participation
  enum :status, { pending: 0, accepted: 1, refused: 2 }
end
