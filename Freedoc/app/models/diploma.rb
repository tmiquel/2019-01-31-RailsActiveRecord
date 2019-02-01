class Diploma < ApplicationRecord
  belongs_to :recipient, class_name: 'Doctor'
  belongs_to :specialty
end
