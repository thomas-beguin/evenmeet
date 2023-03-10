class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many   :reward_choices
  has_many   :sender_relationships,   class_name: "Relationship", foreign_key: "sender_id",   dependent: :destroy
  has_many   :receiver_relationships, class_name: "Relationship", foreign_key: "receiver_id", dependent: :destroy
  has_many   :senders
  has_many   :sender_challenges,   through: :sender_relationships,   source: :challenge
  has_many   :receiver_challenges, through: :receiver_relationships, source: :challenge
end
