# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#              unit_reviews GET    /units/:unit_id/reviews(.:format)                                                        reviews#index
#                           POST   /units/:unit_id/reviews(.:format)                                                        reviews#create
#               unit_review GET    /units/:unit_id/reviews/:id(.:format)                                                    reviews#show
#                           PATCH  /units/:unit_id/reviews/:id(.:format)                                                    reviews#update
#                           PUT    /units/:unit_id/reviews/:id(.:format)                                                    reviews#update
#                           DELETE /units/:unit_id/reviews/:id(.:format)                                                    reviews#destroy
#                     units GET    /units(.:format)                                                                         units#index
#                           POST   /units(.:format)                                                                         units#create
#                      unit GET    /units/:id(.:format)                                                                     units#show
#                           PATCH  /units/:id(.:format)                                                                     units#update
#                           PUT    /units/:id(.:format)                                                                     units#update
#                           DELETE /units/:id(.:format)                                                                     units#destroy
#                    search GET    /search(.:format)                                                                        units#search
#                      auth POST   /auth(.:format)                                                                          authentication#login
#                           GET    /*a(.:format)                                                                            application#not_found
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :units do
    resources :reviews
  end
  get '/search', to: 'units#search'
  post '/auth', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
