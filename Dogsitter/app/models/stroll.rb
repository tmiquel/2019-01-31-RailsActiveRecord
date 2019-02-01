class Stroll < ApplicationRecord
  belongs_to :dog
  belongs_to :dog_sitter
  belongs_to :city, optional: true
end
