class Flower < ApplicationRecord
  has_many :proportions, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
end

