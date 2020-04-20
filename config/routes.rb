Rails.application.routes.draw do
  devise_for :users
  root to: 'courses#index'
  
  get '/search', to: 'buckets#search'
  
  post '/courses/:id/rate', to: 'courses#rate'
  post '/courses/:id/effort', to: 'courses#effort'
end
 