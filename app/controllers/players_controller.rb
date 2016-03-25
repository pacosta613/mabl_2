require 'pry'
class PlayersController < ApplicationController

  get '/players' do
    @players = Player.all
    erb :'players/index'
  end

  get '/players/new' do
    @team = Team.find_by(params[:team_id])
     
    erb :'/players/new'
  end

  get '/players/:id' do 
    @player = Player.find_by_id(params[:id])

    @player.save
    erb :'/players/show'
    #binding.pry
  end

  get '/players/:id/edit' do 
    @player = Player.find_by_id(params[:id])
    @player.save
    erb :'players/edit'
  end

  post '/players/:id' do 
    @player = Player.find_by_id(params[:id])
    @teams = Team.find_by(params[:team_id])
    @player.team = Team.find_by(params[:team_id])
    @player.name = params[:name]
    @player.position = params[:position]
    @player.jersey_number = params[:jersey_number]
    @player.save 

    redirect "/players/#{@player.id}"
  end

  post '/players' do 
    @player = Player.new
    @player.team = Team.find_by(params[:team_id])
    @player.name = params[:name]
    @player.position = params[:position]
    @player.jersey_number = params[:jersey_number]
    @player.save
    #binding.pry
    redirect "/players/#{@player.id}"

  end

  get '/players/:id/delete' do
    league = Player.find(params[:id]).delete
    redirect '/players'
  end

end