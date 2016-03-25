class LeaguesController < ApplicationController

  get '/leagues' do 
    @leagues = League.all
    erb :'leagues/index'
  end

  get '/leagues/new' do 
    erb :'leagues/new'
  end

  get '/leagues/:id' do 
    @league = League.find_by_id(params[:id])
    erb :'leagues/show'
  end

  get '/leagues/:id/edit' do 
    @league = League.find_by_id(params[:id])
    @league.save
    erb :'leagues/edit'
  end

  post '/leagues/:id' do 
    @league = League.find_by_id(params[:id])
    @league.name = params[:name]
    @league.save

    redirect "/leagues/#{@league.id}"
  end

  post '/leagues' do 
    @league = League.new
    @league.name = params[:name]
    @league.save

    redirect "/leagues/#{@league.id}"
  end

  post '/teams' do 
    @team = Team.new
    @team.league = League.find_by_id(params[:league_id])
    @team.name = params[:name]
    @team.save

    redirect "/teams/#{@team.id}"
  end

  get '/leagues/:id/delete' do
    @league = League.find(params[:id]).delete
    redirect '/leagues'
  end

end