Rails.application.routes.draw do

  root :to => 'landing_page#home'
  get '/dashboard' => 'landing_page#dashboard'
  get '/map' => 'landing_page#map'

  # Session routes:
  get '/login' => 'session#new'   #Login form
  post '/login' => 'session#create'   #Form submits here. Check credentials. Create session.
  delete '/login' => 'session#destroy'   #Log out

  resources :users
  post '/match/:id' => 'users#create_match', as: 'create_match'

  get '/messages/:user_id' => 'messages#index', as: 'messages_with'

  resources :photos

end