class AddGameUrlToGameSites < ActiveRecord::Migration[6.0]
  def change
    add_column :game_sites, :game_url, :string
  end
end
