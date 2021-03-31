Rails.application.routes.draw do
  resources :destinations do
    resources :reviews
  end
  get '/random', to: 'destinations#random'
end
