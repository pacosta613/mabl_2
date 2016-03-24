class LeaguesController < ApplicationController

  get '/leagues' do 
    @leagues = League.all
    erb :'leagues/index'
  end

  get '/leagues/new' do 
    erb :'leagues/new'
  end

  get '/leagues/:id' do 
    @leagues = League.find_by_id(params[:id])
    erb :'leagues/show'
  end

  get '/leagues/:id/edit' do 
    @leagues = League.find_by_id(params[:id])
    @leagues.save
    erb :'leagues/edit'
  end

  post '/leagues/:id' do 
    @leagues = League.find_by_id(params[:id])
    @leagues.name = params[:name]
    @leagues.team = Team.find_by(name: params[:teams])
    @leagues.save

    redirect "/leagues/#{@leagues.id}"
  end

  post '/leagues' do 
    @leagues = League.new
    @leagues.team = Team.find_by(name: params[:teams])
    @leagues.name = params[:name]
    @leagues.save

    redirect "/leagues/#{@leagues.id}"
  end

  get '/leagues/:id/delete' do
    league = League.find(params[:id]).delete
    redirect '/leagues'
  end

end