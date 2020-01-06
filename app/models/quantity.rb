class Quantity < ApplicationRecord
  belongs_to :order
  belongs_to :composition
end
