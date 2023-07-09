class Student < ApplicationRecord
  has_many :policies, dependent: :destroy
end
