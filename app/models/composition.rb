class Composition < ApplicationRecord
  has_many :proportions, dependent: :destroy
  has_many :quantities
  has_many :flowers, through: :proportions

  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :quantities
end
