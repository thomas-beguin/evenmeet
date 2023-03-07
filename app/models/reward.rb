class Reward < ApplicationRecord
  belongs_to :event
  has_one_attached :photo
end
