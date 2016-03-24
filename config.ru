 require './config/environment'
 require_relative './app/controllers/leagues_controller'
 require_relative './app/controllers/players_controller'
 require_relative './app/controllers/teams_controller'

use LeaguesController
use PlayersController
use TeamsController
run ApplicationController