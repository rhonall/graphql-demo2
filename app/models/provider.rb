class Provider < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :policy_type, presence: true,
    inclusion: { in: %w(oshc nz), message: "%{value} is not valid, please select between 'oshc' or 'nz'" }
end
