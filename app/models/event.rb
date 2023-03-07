class Event < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :rewards, dependent: :destroy

  # validates :end_date, comparison: { greater_than: :start_date }
end
