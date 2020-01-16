Rails.application.routes.draw do

  root :to => 'landing_page#home'
  get '/dashboard' => 'landing_page#dashboard'
  get '/map' => 'landing_page#map'

  # Session routes:
  get '/login' => 'session#new'   #Login form
  post '/login' => 'session#create'   #Form submits here. Check credentials. Create session.
  delete '/login' => 'session#destroy'   #Log out

  resources :users, :photos
  
  # get '/users/:id/profile' => 'users#profile', as: 'profile'

  # resources :conversations, only: [:index, :create] do
  #   resources :messages, only: [:index, :create]
  # end

end