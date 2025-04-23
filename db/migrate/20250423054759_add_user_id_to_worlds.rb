class AddUserIdToWorlds < ActiveRecord::Migration[8.0]
  def change
    add_reference :worlds, :user, null: true, foreign_key: true
  end
end
