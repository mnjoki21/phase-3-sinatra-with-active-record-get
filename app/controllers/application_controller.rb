class ApplicationController < Sinatra::Base

  # get '/' do
  #   { message: "Hello world" }.to_json
  # end
  set :default_content_type, 'application/json'

   get '/games' do
    # get all the games from the database
    games = Game.all.order(:title).limit(10)
    # return a JSON response with an array of all the game data
    games.to_json
  end

  get 'games/:id' do
    game = Game.find(params[:id])
    game.to_json(include: :reviews)
    
  end
end
