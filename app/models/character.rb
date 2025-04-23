class Character < ApplicationRecord
  belongs_to :world, optional: true
  belongs_to :user, optional: true  # null: true にしたのでoptionalを明示
end
  