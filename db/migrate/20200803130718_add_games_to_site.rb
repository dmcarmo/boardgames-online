class AddGamesToSite < ActiveRecord::Migration[6.0]
  def change
    add_column :sites, :games_list, :string, array: true, default: []
  end
end
