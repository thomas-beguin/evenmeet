class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations, dependent: :destroy
  has_many :events,         through: :participations
  has_many :relationships,  through: :participations
  has_many :messages,       dependent: :destroy
  has_many_attached :photos

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :last_name, presence: true

  def current_event
    current_events = events.current
    if current_events.any?
      current_events.first
    else
      events.incoming.first
    end
  end
end
