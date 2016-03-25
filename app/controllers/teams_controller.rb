class TeamsController < ApplicationController

  get '/teams' do 
    @teams = Team.all
    erb :'teams/index'
  end

  get '/teams/new' do 
    erb :'teams/new'
  end

  get '/teams/:id' do 
    @team = Team.find_by_id(params[:id])
    
    erb :'teams/show'
  end

  get '/teams/:id/edit' do 
    @team = Team.find_by_id(params[:id])
    @team.save
    erb :'teams/edit'
  end

  post '/teams/:id' do 
    @team = Team.find_by_id(params[:id])
    @league = League.find_by_id(params[:league_id])
    @team.league = League.find_by_id(params[:league_id])
    @team.name = params[:name]
    @team.save

    redirect "/teams/#{@team.id}"
  end

  post '/teams' do 
    @team = Team.new
    @team.league = League.find_by_id(params[:league_id])
    @team.name = params[:name]
    @team.save

    redirect "/teams/#{@team.id}"
  end

  post '/players' do 
    @player = Player.new
    @player.team = Team.find_by_id(params[:team_id])
    @player.name = params[:name]
    @player.position = params[:position]
    @player.jersey_number = params[:jersey_number]
    @player.save
    #binding.pry
    redirect "/players/#{@player.id}"

  end

  get '/teams/:id/delete' do
    league = Team.find(params[:id]).delete
    redirect '/teams'
  end

end