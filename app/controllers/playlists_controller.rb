class PlaylistsController < ApplicationController
  before_action :require_login
  def index
  end

  def new
  end

  def AddPlaylist
    @song = Song.find(params[:id])
    @song.update_attribute(:count, @song.count + 1)
    @user = User.find(session[:user_id])
    @playlist = Playlist.create(title: @song.title,artist: @song.artist,user: @user,song: @song,count: +1)
    redirect_to :back

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
