class CreateCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.string :world
      t.string :image_url

      t.timestamps
    end
  end
end
