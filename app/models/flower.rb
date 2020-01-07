class Flower < ApplicationRecord
  has_many :proportions, dependent: :restrict_with_error

  def nameandcolor
    "#{self.name} #{self.color}"
  end
end
