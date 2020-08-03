class Game < ApplicationRecord
  has_many :game_sites, dependent: :destroy
  has_many :sites, through: :game_sites
end
