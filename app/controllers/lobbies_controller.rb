class LobbiesController < ApplicationController
  before_action :require_login

  def index
    @lobbies = Lobby.all
  end
end
