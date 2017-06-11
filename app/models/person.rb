class Person < ApplicationRecord
  scope :active, -> { where(active: true) }
end
