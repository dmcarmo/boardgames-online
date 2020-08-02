puts "Destroying all games..."
Game.destroy_all
puts "Finished!"

puts "Creating games..."
games = Game.create([
  { name: "Agricola"},
  { name: "The Gallerist"}
])
puts "Finished!"