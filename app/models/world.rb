class World < ApplicationRecord
    has_many :characters, dependent: :destroy
    belongs_to :user, optional: true  # null: true にしたのでoptionalを明示
  end
  