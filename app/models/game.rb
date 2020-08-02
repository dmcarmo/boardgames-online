class Game < ApplicationRecord
  has_many :game_sites
  has_many :sites, through: :game_sites
end
