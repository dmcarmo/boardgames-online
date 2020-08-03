class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :bgg_url
      t.string :bgg_id
      
      t.timestamps
    end
  end
end
