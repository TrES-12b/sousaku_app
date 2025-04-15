class Character < ApplicationRecord
  belongs_to :world, optional: true
end
  