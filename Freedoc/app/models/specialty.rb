class Specialty < ApplicationRecord
  has_many :diploma
  has_many :doctors, through: :diploma
end
