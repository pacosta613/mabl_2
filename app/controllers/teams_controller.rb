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
    @team.name = params[:name]
    @team.save

    redirect "/teams/#{@team.id}"
  end

  post '/teams' do 
    @team = Team.new
    @team.name = params[:name]
    @team.save

    redirect "/teams/#{@team.id}"
  end

  get '/teams/:id/delete' do
    league = Team.find(params[:id]).delete
    redirect '/teams'
  end

end