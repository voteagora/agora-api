# Cleanup
puts "Cleaning up old data..."
Dao.delete_all
ApiUser.delete_all
puts "Done cleaning up old data..."

puts "Loading up some fake data..."

# Load Up Uniswap
noun = Dao.create!(name: "Nouns", token: "NOUN", chain: "L1 Ethereum")

puts "Creating API Users..."
ApiUser.create!(name: "Dev Agora Key")


