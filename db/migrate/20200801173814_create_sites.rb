class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.date :last_check

      t.timestamps
    end
  end
end
