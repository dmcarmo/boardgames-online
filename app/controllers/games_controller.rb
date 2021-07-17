class GamesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @sites = Site.all
    @games = Game.includes(:sites).reorder(:name)
    @games = @games.search_by_name(params[:search]).includes(:sites).reorder(:name) if params[:search].first != ''
    if params[:site] && params[:site].first != ''
      site_ids = params[:site].map(&:to_i)
      game_ids = Site.where(id: site_ids).map { |site| site.games.pluck(:id) }.flatten.uniq
      @games = @games.where(id: game_ids).includes(:sites).reorder(:name)
    end
    @pagy, @games = pagy(@games)
    render json: { games: @games, sites: @sites, pagy: { count: @pagy.count, pages: @pagy.pages } }
  end

  def show
    @game
  end
end
