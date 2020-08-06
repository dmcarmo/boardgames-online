class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @sites = Site.all
    if params["query"].present?
      @games = Game.search_by_name(params["query"]).includes(:sites)
    else
      @games = Game.includes(:sites)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @game
  end
end
