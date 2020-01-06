class Composition < ApplicationRecord
  has_many :proportions
  has_many :quantites
  has_many :flowers, through: :proportions
end
