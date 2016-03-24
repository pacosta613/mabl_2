class User < ActiveRecord::Base
  has_secure_password
  has_many :leagues
  has_many :teams
  has_many :players
  has_many :teams, through: :leagues
  has_many :players, through: :leagues
end