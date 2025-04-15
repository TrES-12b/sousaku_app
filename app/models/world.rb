class World < ApplicationRecord
    has_many :characters, dependent: :destroy
  end
  