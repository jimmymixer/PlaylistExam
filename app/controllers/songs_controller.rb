class SongsController < ApplicationController
  before_action :require_login
  def index
    @songs = Song.all

  end

  def create
  @user = User.find(session[:user_id])
  @song = Song.create(title: params[:title], artist: params[:artist], user: @user, count:+1)

    if @song.valid?
      redirect_to "/songs/index"
    else
      flash[:errors] = @song.errors.full_messages
      redirect_to :back
    end
  end



  def show
    @song = Song.find(params[:id])
    @playlist = Playlist.where(song: @song)
  end


end
