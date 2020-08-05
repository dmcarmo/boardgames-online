class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params["query"].present?
      @games = Game.all.search_by_name(params["query"])
    else
      @games = Game.all
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
