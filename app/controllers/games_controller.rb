class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @sites = Site.includes(:games)
    @games = Game.includes(:sites)
    if params["filter"].present?
      if params["filter"]["sites"].present?
        site_ids = params["filter"]["sites"].map {|s| s.to_i}
        game_ids = Site.where(id: site_ids).map{ |site| site.games.pluck(:id) }.flatten.uniq
        @games = @games.where(id: game_ids).includes(:sites)
      end
      if params["filter"]["search"].present?
        query = params["filter"]["search"]
        @games = @games.search_by_name(query).includes(:sites)
      end
    end
    puts @games
    puts @sites
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @game
  end
end
