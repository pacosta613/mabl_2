class League < ActiveRecord::Base
  belongs_to :users
  has_many :teams
  has_many :players
  has_many :players, through: :teams
end