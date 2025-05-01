class AddThemeTitleToCharacters < ActiveRecord::Migration[8.0]
  def change
    add_column :characters, :theme_title, :string
  end
end
