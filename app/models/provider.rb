class Provider < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :policy_type, presence: true, inclusion: { in: %w(oshc nz), message: "%{value} is not a valid policy type" }
end
