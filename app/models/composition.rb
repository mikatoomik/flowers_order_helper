class Composition < ApplicationRecord
  has_many :proportions, dependent: :destroy
  has_many :quantites
  has_many :flowers, through: :proportions

  validates :name, presence: true, uniqueness: true
end
