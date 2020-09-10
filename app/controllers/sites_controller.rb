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
    redirect_to sites_path
  end

  def get_games(page)
    results = {}
    case @site.name
    when "Boiteajeux"
      boiteajeux(page, results)
    when "Boardgamearena"
      boardgamearena(page, results)
    else
      puts "Implement parsing logic for #{@site.name}"
    end
  end

  def boiteajeux(page, results)
    page.search('.jeuxRegles').each do |element|
      name = element.xpath('text()').text.strip.capitalize # replace all spaces with underscores
      bgg_search = element.search('@href').select{|link| link.text.include?("geek")}
      if bgg_search.empty?
        bgg_url = ""
        bgg_id = ""
      else
        bgg_url = element.search('@href').select{|link| link.text.include?("geek")}.last.text
        bgg_id = bgg_url.split("/")[-2]
      end
      results[name.to_sym] = { bgg_url: bgg_url, bgg_id: bgg_id }
    end
    results
  end

  def boardgamearena(page, results)
    page.search('#gamelist_itemrow_inner_all .gamelist_item').each do |element|
      name = element.search(".gamename").text.strip
      # implement bgg_url and bgg_id methods
      bgg_url = ""
      bgg_id = ""
      results[name.to_sym] = { bgg_url: bgg_url, bgg_id: bgg_id }
    end
    results
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:name, :url)
  end

  def get_page(url)
    page = ""
    begin
      page = Nokogiri::HTML(open(url).read)
    rescue Timeout::Error
      puts "Timeout connecting to #{url}"
    rescue SocketError
      puts "Unknown server - #{url}"
    end
    page
  end
end
