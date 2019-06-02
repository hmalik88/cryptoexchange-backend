Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :users
        post '/transfers', to: 'transfers#create'
        get '/transfers', to: 'transfers#index'
        get '/current_user', to: 'auth#show'
        post '/login', to: 'auth#create'
      end
  end
end
