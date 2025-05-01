class AddIconToCharacters < ActiveRecord::Migration[8.0]
  def change
    add_column :characters, :icon, :string
  end
end
