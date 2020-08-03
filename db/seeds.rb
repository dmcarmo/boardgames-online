puts "Destroying all games..."
Game.destroy_all
puts "Finished!"

puts "Destroying all sites..."
Site.destroy_all
puts "Finished!"

puts "Creating sites..."
sites = Site.create([
  { name: "Boiteajeux", url: "http://boiteajeux.net/index.php?p=regles"}
])
puts "Finished!"

# puts "Creating games..."
# games = Game.create([
#   { name: "Agricola"}
# ])
# puts "Finished!"