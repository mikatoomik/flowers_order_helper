class Quantity < ApplicationRecord
  belongs_to :order
  belongs_to :composition

  validates :compositions_number, presence: true
  validates_uniqueness_of :order, scope: :composition
end
