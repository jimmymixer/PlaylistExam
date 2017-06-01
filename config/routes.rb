Rails.application.routes.draw do

# -----------------USERS----------------------------
  get '' => 'users#index'

  post 'users/' => 'users#create'

  post 'users/login' => 'users#login'

  get 'users/:id' => 'users#show'

  delete 'users/:id' => 'users#destroy'

  # ----------------SONG------------------------

  get 'songs/index' => 'songs#index'

  post 'songs/' => 'songs#create'

  get 'songs/:id/show' => 'songs#show'

  # ---------------PLAYLIST-------------------

  patch '/playlists/:id/AddPlaylist' => 'playlists#AddPlaylist' # ADD PLAYLIST

end
