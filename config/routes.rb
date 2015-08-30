require 'api_constraints'
Rails.application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :users
  #API definition
  namespace :api, defaults: { format: :json }, 
                            # Set api under subdomain
                              constraints: { subdomain: 'api' }, path: '/' do 
    #API versioning, app/controllers/api/v1
    #example: http://api.marketplace.dev/v1/products/1
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do 
      #Lists resources
      resources :users, only: [ :show, :create, :update, :destroy ]
      resources :sessions, only: [:create, :destroy]
    end 

  end 
end
