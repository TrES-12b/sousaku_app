class AddDetailsToCharacters < ActiveRecord::Migration[8.0]
  def change
    add_column :characters, :color_code, :string
    add_column :characters, :theme_song, :string
  end
end
