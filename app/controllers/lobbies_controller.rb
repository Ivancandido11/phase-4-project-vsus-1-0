class LobbiesController < ApplicationController
  def index
    @lobbies = Lobby.all
  end
end
