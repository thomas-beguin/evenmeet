class Relationship < ApplicationRecord
  # Permet de faire : relation.participation_sender = participation
  # Sinon, on doit passer par l'id
  belongs_to :sender, class_name: "Participation"

  # Permet de faire : relation.participation_receiver = participation
  # Sinon, on doit passer par l'id
  belongs_to :receiver, class_name: "Participation"

  has_many   :challenge, dependent: :destroy
  enum :status, { pending: 0, accepted: 1, refused: 2 }
end
