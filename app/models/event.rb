class Event < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many_attached :photos

  validates :end_date, comparison: { greater_than: :start_date }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
