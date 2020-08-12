class Game < ApplicationRecord
  has_many :game_sites, dependent: :destroy
  has_many :sites, through: :game_sites

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: :name,
    using: {
      tsearch: { prefix: true }
    }
end
