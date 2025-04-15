class AddWorldToCharacters < ActiveRecord::Migration[8.0]
  def change
    add_reference :characters, :world, foreign_key: true
  end
end
