Rails.application.routes.draw do

resources :users
  resources :todos

  post   '/login' ,to: 'sessions#create',defaults: {format: 'json'}
  delete '/logout' ,to: 'sessions#destroy',defaults: {format: 'json'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

end
