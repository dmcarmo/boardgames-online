class Site < ApplicationRecord
  has_many :game_sites, dependent: :destroy
  has_many :games, through: :game_sites
end
