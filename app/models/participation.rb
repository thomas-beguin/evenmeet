class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many   :reward_choices
  # has_many   :relationships
  has_many   :sender_relationships, class_name:  "Relationship",
                                    foreign_key: "sender_id",
                                    dependent: :destroy
  has_many   :receiver_relationships, class_name:  "Relationship",
                                       foreign_key: "receiver_id",
                                       dependent: :destroy
  has_many   :senders
end
