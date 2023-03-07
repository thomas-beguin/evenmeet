class Event < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :rewards, dependent: :destroy
end
