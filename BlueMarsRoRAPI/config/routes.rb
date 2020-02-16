Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, param: :_username
  resources :units do
    resources :reviews
  end

  get '/search', to: 'units#search'
  post '/auth', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
