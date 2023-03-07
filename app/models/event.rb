class Event < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many_attached :photos

  validates :end_date, comparison: { greater_than: :start_date }
end
