class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @sites = Site.includes(:games)
    @pagy, @games = pagy(Game.includes(:sites))
    if params["filter"].present?
      if params["filter"]["sites"].present?
        site_ids = params["filter"]["sites"].map {|s| s.to_i}
        game_ids = Site.where(id: site_ids).map{ |site| site.games.pluck(:id) }.flatten.uniq
        @pagy, @games = pagy(@games.where(id: game_ids).includes(:sites))
      end
      if params["filter"]["search"].present?
        query = params["filter"]["search"]
        @pagy, @games = pagy(@games.search_by_name(query).includes(:sites))
      end
    end
    puts @games
    puts @sites
    puts @pagy
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @game
  end
end
