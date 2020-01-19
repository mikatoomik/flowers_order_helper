class Order < ApplicationRecord
  belongs_to :user
  has_many :quantities, dependent: :destroy
  has_many :compositions, through: :quantities
  has_many :flowers, through: :compositions
  serialize :theme, Array
  validates :date, presence: true
end
