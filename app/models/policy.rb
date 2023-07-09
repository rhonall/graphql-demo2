class Policy < ApplicationRecord
  belongs_to :provider
  belongs_to :product
  belongs_to :student
end
