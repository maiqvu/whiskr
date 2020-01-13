Rails.application.routes.draw do

  root :to => 'landing_page#home'
  get '/dashboard' => 'landing_page#dashboard'

  # Session routes:
  get '/login' => 'session#new'   #Login form
  post '/login' => 'session#create'   #Form submits here. Check credentials. Create session.
  delete '/login' => 'session#destroy'   #Log out

  resources :users

end