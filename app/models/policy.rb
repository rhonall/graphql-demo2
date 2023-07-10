class Policy < ApplicationRecord
  belongs_to :provider
  belongs_to :product
  belongs_to :student

  validates :policy_type, inclusion: { in: %w(oshc nz), message: "%{value} is not valid, please select between 'oshc' or 'nz'" }
  validate :ensure_product_belongs_to_provider

  def ensure_product_belongs_to_provider
    unless product.provider == provider
      self.errors.add(:product, "Product does not belong to selected provider")
      throw(:abort)
    end
  end
end
