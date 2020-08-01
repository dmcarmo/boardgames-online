class CreateGameSites < ActiveRecord::Migration[6.0]
  def change
    create_table :game_sites do |t|
      t.references :game, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
