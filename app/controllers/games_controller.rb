class GamesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @sites = Site.all
    @pagy, @games = pagy(Game.includes(:sites).reorder(:name))
    if params['filter'].present?
      if params['filter']['sites'].present?
        site_ids = params['filter']['sites'].map {|s| s.to_i}
        game_ids = Site.where(id: site_ids).map{ |site| site.games.pluck(:id) }.flatten.uniq
        @pagy, @games = pagy(@games.where(id: game_ids).includes(:sites).reorder(:name))
      end
      if params['filter']['search'].present?
        query = params['filter']['search']
        @pagy, @games = pagy(@games.search_by_name(query).includes(:sites).reorder(:name))
      end
    end
    # puts @games
    # puts @sites
    # puts @pagy
    render json: { games: @games, sites: @sites, pagy: pagy_metadata(@pagy) }
  end

  def show
    @game
  end
end
