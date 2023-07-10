class Product < ApplicationRecord
  belongs_to :provider

  validates :name, presence: true
end
