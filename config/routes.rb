Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :usernames
      post '/login', to: 'auth#create'
      resources :userscores
      resources :scores
    end
  end
end
