require "sinatra"
require "active_record"
require "pg"

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "flashcards"
)

class Deck < ActiveRecord::Base
  has_many :cards 
end

class Card < ActiveRecord::Base 
end
get "/" do
  @decks = Deck.all
  erb :index 
end
#
# get "/decks/new" do
#   erb :new_deck
# end

get "/decks/:id" do
  @deck = Deck.find(params[:id])
  @cards = @deck.cards

  erb :show   
end
