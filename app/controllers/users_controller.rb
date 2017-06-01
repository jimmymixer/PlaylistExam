class UsersController < ApplicationController
  before_action :require_login, except: [:index,:login, :create]

  def index # renders index page
  end

  def create
    @users = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      )

      if @users.valid?
        session[:user_id] = @users.id
        redirect_to "/songs/index"
      else
        flash[:errors] = @users.errors.full_messages
        redirect_to :back
      end
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/songs/index"
    else
      flash[:error] = "Invalid Credentials"
      redirect_to "/"
    end
  end

  def show
    @user = User.find(params[:id])
    @playlist = Playlist.where('user_id=?', params[:id])

  end


  def destroy
    session.clear
    redirect_to "/"
  end

end
