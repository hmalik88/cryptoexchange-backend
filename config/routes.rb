Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :users
        post '/transfers', to: 'transfers#create'
        get '/transfers', to: 'transfers#index'
      end
  end
end
