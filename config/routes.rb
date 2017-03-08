Rails.application.routes.draw do

resources :users
resources :attractions
get '/signin', to: "sessions#signin"
post '/signin', to: "sessions#create"
delete '/logout', to: "sessions#logout"
post '/attractions/:user_id/ride/:attraction_id', to: 'rides#create'
root 'registrations#welcome'
end