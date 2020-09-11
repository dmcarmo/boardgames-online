class SitesController < ApplicationController

  before_action :set_site, only: [:show, :edit, :update, :update_games, :destroy]

  def index
    @sites = Site.all
  end

  def show
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.save
    redirect_to site_path(@site)
  end

  def edit
  end

  def update
  end

  def update_games
    page = get_page(@site.url)
    results = get_games(page)
    results.keys.each do |item|
      if Game.find_by(name: item.to_s).nil?
        Game.create(name: item.to_s, bgg_id: results[item][:bgg_id], bgg_url: results[item][:bgg_url])
      end
      game = Game.find_by(name: item.to_s)
      unless @site.games.include?(game)
        @site.games << game
      end
    end
    @site.last_check = Date.today
    @site.save
    redirect_to site_path(@site)
  end

  def destroy
    @site.destroy
    # when site is deleted games can be orphaned - delete orphaned games?
    redirect_to sites_path
  end

  def get_games(page)
    results = {}
    case @site.name
    when "BoardGameArena"
      boardgamearena(page, results)
    when "Boiteajeux"
      boiteajeux(page, results)
    when "HappyMeeple"
      happymeeple(page, results)
    when "Tabletopia"
      tabletopia(page, results)
    when "Vassal"
      vassal(page, results)
    when "Yucata"
      yucata(page, results)
    else
      puts "Implement parsing logic for #{@site.name}"
    end
  end

  def boardgamearena(page, results)
    page.search("#gamelist_itemrow_inner_all .gamelist_item").each do |element|
      name = element.search(".gamename").text.strip.split("\r").first.capitalize
      bgg_url = ""
      bgg_id = ""
      results[name.to_sym] = { bgg_url: bgg_url, bgg_id: bgg_id }
    end
    results
  end

  def boiteajeux(page, results)
    page.search(".jeuxRegles").each do |element|
      name = element.search("text()").text.strip.capitalize
      bgg_search = element.search("@href").select{|link| link.text.include?("geek")}
      if bgg_search.empty?
        bgg_url = ""
        bgg_id = ""
      else
        bgg_url = element.search("@href").select{|link| link.text.include?("geek")}.last.text
        bgg_id = bgg_url.split("/")[-2]
      end
      results[name.to_sym] = { bgg_url: bgg_url, bgg_id: bgg_id }
    end
    results
  end

  def happymeeple(page, results)
    page.search(".pres_game").each do |element|
      name = element.search("div @title").text
      # game_url = element.search("a @href").text
      bgg_url = ""
      bgg_id = ""
      results[name.to_sym] = { bgg_url: bgg_url, bgg_id: bgg_id }
    end
    results
  end

  def tabletopia(page, results)
    base_url = "https://tabletopia.com"
    total_pages = page.search(".pagination__item")[-2].text.to_i
    (1..total_pages).each do |index|
      page.search(".catalog__item").each do |element|
        name = element.search(".item__title-wrapper").text.strip
        # game_url = base_url + element.search(".item__button @href").text
        bgg_url = ""
        bgg_id = ""
        results[name.to_sym] = { bgg_url: bgg_url, bgg_id: bgg_id }
      end
      if index < total_pages
        next_page = page.search(".pagination__item")[-1].search("a @href").to_s
        page = get_page(next_page)
      end
    end
    results
  end

  def vassal(page, results)
    base_url = "http://www.vassalengine.org"
    pages_in_category = page.search("#mw-pages p").text
    total_games = pages_in_category.split[-2].delete(",").to_f
    games_page = pages_in_category.split[2].delete(",").to_f
    total_pages = (total_games / games_page).ceil
    (1..total_pages).each do |index|
      page.search(".mw-category a").each do |element|
        name = element.search("@title").text.delete("\"").split("Module:").last
        # game_url = base_url + element.search("@href").text
        bgg_url = ""
        bgg_id = ""
        results[name.to_sym] = { bgg_url: bgg_url, bgg_id: bgg_id }
      end
      if index < total_pages
        next_page = base_url + page.search("//a[text()='next page']")[0].search("@href").to_s
        page = get_page(next_page)
      end
    end
    results
  end

  def yucata(page, results)
    base_url = "https://www.yucata.de"
    page.search("#ctl00_cphRightCol_dlAllGames a").each do |element|
      name = element.search("@data-gamename").text
      # game_url = base_url + element.search("@href").text
      bgg_url = ""
      bgg_id = ""
      results[name.to_sym] = { bgg_url: bgg_url, bgg_id: bgg_id }
    end
    results
  end

# list of sites
# implemented:
#   BoardGameArena, Boardgamecore, BoardGamePlay, BoardGamingOnline, Boiteajeux,
#   Happy Meeple, MaBi Web, Online Terra Mystica, Orderofthehammer, rr18xx,
#   SlothNinja, VASSAL, Web Diplomacy, Yucata, Tabletopia
# to implement:
#   http://www.brettspielwelt.de/Spiele/?nation=en, https://triqqy.com/#/games
#   TTS official, TTS workshop (https://steamcommunity.com/workshop/browse/?appid=286160)
#   https://warchestonline.com/

# need to implement a method that requests the BGG API a list of names and id of all games and stores it for queries

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:name, :url)
  end

  def get_page(url)
    headers = "tabletopia".in?(url) ? {"X-Requested-With" => "XMLHttpRequest"} : {}
    page = ""
    begin
      page = Nokogiri::HTML(open(url, headers).read)
    rescue Timeout::Error
      puts "Timeout connecting to #{url}"
    rescue SocketError
      puts "Unknown server - #{url}"
    end
    page
  end
end
