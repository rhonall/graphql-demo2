class Student < ApplicationRecord
  has_many :policies, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :gender, presence: true,
    inclusion: { in: %w(male female), message: "%{value} is not valid, please select between 'male' or 'female'" }
end
