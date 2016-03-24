require 'pry'
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
    @players.save
    erb :'/players/show'
    binding.pry
  end

  get '/players/:id/edit' do 
    @players = Player.find_by_id(params[:id])
    @players.save
    erb :'players/edit'
  end

  post '/players/:id' do 
    @players = Player.find_by_id(params[:id])
    @teams = Team.find_by(params[:team_id])
    @players.team = Team.find_by(params[:team_id])
    @players.name = params[:name]
    @players.position = params[:position]
    @players.jersey_number = params[:jersey_number]
    @players.save 

    redirect "/players/#{@players.id}"
  end

  post '/players' do 
    @players = Player.new

    @teams = Team.find_by(params[:team_id])
    @players.team = Team.find_by(params[:team_id])
    @players.name = params[:name]
    @players.position = params[:position]
    @players.jersey_number = params[:jersey_number]
    @players.save

    redirect "/players/#{@players.id}"
  end

  get '/players/:id/delete' do
    league = Player.find(params[:id]).delete
    redirect '/players'
  end

end