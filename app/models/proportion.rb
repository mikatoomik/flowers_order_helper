class Proportion < ApplicationRecord
  belongs_to :flower
  belongs_to :composition

  validates :stems_number, presence: true
  validates_uniqueness_of :composition, scope: :flower
end
