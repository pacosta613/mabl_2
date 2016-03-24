class PlayersController < ApplicationController

  get '/players' do
    @players = Player.all
    erb :'players/index'
  end

  get '/players/new' do 
    erb :'/players/new'
  end

  get '/players/:id' do 
    @players = Player.find_by_id(params[:id])
    erb :'/players/show'
  end

  get '/players/:id/edit' do 
    @players = Player.find_by_id(params[:id])
    @players.save
    erb :'players/edit'
  end

  post '/players/:id' do 
    @players = Player.find(params[:id])
    @players.name = params[:name]
    @players.position = params[:position]
    @players.jersey_number = params[:jersey_number]
    @players.save 

    redirect "/players/#{@players.id}"
  end

  post '/players' do 
    @players = Player.new
    @players.name = params[:name]
    @players.position = params[:position]
    @players.jersey_number = params[:jersey_number]
    @players.save

    redirect "/players/#{@players.id}"
  end

end