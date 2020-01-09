class Order < ApplicationRecord
  belongs_to :user
  has_many :quantities
  has_many :compositions, through: :quantities
  has_many :flowers, through: :compositions

  validates :date, presence: true
end
