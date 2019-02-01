class DogSitter < ApplicationRecord
  has_many :strolls, dependent: :destroy
  belongs_to :city, optional: true
end
