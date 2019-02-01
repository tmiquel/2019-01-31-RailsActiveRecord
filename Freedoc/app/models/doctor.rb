class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  has_many :diploma
  has_many :specialty, through: :diploma
  belongs_to :city, optional: true
end
