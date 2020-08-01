class Site < ApplicationRecord
  has_many :game_sites
  has_many :games, through: :game_sites
end
