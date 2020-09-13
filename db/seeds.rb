puts "Destroying all games..."
Game.destroy_all
puts "Finished!"

puts "Destroying all sites..."
Site.destroy_all
puts "Finished!"

puts "Creating sites..."
sites = Site.create([
  { name: "Boiteajeux", url: "http://boiteajeux.net", parser_url: "http://boiteajeux.net/index.php?p=regles"},
  { name: "BoardGameArena", url: "https://en.boardgamearena.com", parser_url: "https://en.boardgamearena.com/gamelist"},
  # { name: "Boardgamecore", url: "http://play.boardgamecore.net/"},
  # { name: "BoardGamePlay", url: "https://boardgameplay.com/"},
  # { name: "BoardGamingOnline", url: "http://www.boardgaming-online.com/"},
  # { name: "MaBiWeb", url: "http://www.mabiweb.com"},
  # { name: "OnlineTerraMystica", url: "https://terra.snellman.net/"},
  # { name: "Orderofthehammer", url: "http://brass.orderofthehammer.com/"},
  # { name: "rr18xx", url: "http://www.rr18xx.com"},
  # { name: "18xxGames", url: "https://www.18xx.games/"},
  # { name: "SlothNinja", url: "https://www.slothninja.com/"},
  { name: "HappyMeeple", url: "https://www.happymeeple.com", parser_url: "https://www.happymeeple.com/en/"},
  { name: "Tabletopia", url: "https://tabletopia.com", parser_url: "https://tabletopia.com/games?"},
  { name: "Vassal", url: "http://www.vassalengine.org", parser_url: "http://www.vassalengine.org/wiki/Category:Modules"},
  { name: "Yucata", url: "https://www.yucata.de", parser_url: "https://www.yucata.de/en"}
  # { name: "WebDiplomacy", url: "https://www.webdiplomacy.net/"}
])

# "manual" lists for smaller sites
# sites["Boardgamecore (Rules Enforced)"] = {
#     "Antiquity": "http://play.boardgamecore.net/",
#     "Food Chain Magnate": "http://play.boardgamecore.net/",
#     "The Great Zimbabwe": "http://play.boardgamecore.net/",
#     "Wir sind das Volk!": "http://play.boardgamecore.net/"
#     }
# sites["BoardGamePlay (Rules Enforced)"] = {
#     "Rurik: Dawn of Kiev": "https://boardgameplay.com/",
#     "The Manhattan Project: Energy Empire": "https://boardgameplay.com/",
#     "Montana": "https://boardgameplay.com/",
#     "Urbino": "https://boardgameplay.com/"
#     }
# sites["BoardGamingOnline (Rules Enforced)"] = {
#     "Through the Ages: A Story of Civilization": "http://www.boardgaming-online.com/",
#     "Through The Ages: A New Story of Civilization": "http://www.boardgaming-online.com/"
#     }
# sites["MaBi Web (Rules Enforced)"] = {
#     "Nations": "http://www.mabiweb.com/modules.php?name=GM_Nations&op=description",
#     "In the Year of the Dragon": "http://www.mabiweb.com/modules.php?name=GM_YearDragon&op=description",
#     "Mykerinos": "http://www.mabiweb.com/modules.php?name=GM_Mykerinos&op=description",
#     "Ur": "http://www.mabiweb.com/modules.php?name=GM_Ur&op=description",
#     "Kreta": "http://www.mabiweb.com/modules.php?name=GM_Kreta&op=description",
#     "Gods": "http://www.mabiweb.com/modules.php?name=GM_Gods&op=description",
#     "In the Shadow of the Emperor": "http://www.mabiweb.com/modules.php?name=GM_ShadowEmperor&op=description",
#     "Richelieu": "http://www.mabiweb.com/modules.php?name=GM_Richelieu&op=description"
#     }
# sites["Online Terra Mystica (Rules Enforced)"] = {"Terra Mystica": "https://terra.snellman.net/"}
# sites["Orderofthehammer (Rules Enforced)"] = {"Brass": "http://brass.orderofthehammer.com/"}
# sites["rr18xx (Rules Enforced)"] = {"18xx": "http://www.rr18xx.com"}
# sites["SlothNinja (Rules Enforced)"] = {
#     "After The Flood": "https://www.slothninja.com/",
#     "Confucius": "https://www.slothninja.com/",
#     "Guild of Thieves": "https://www.slothninja.com/",
#     "Indonesia": "https://www.slothninja.com/",
#     "Tammany Hall": "https://www.slothninja.com/"
#     }
# sites["Web Diplomacy (Rules Enforced)"] = {"Diplomacy": "https://www.webdiplomacy.net/"}

puts "Finished!"
