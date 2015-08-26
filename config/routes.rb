Rails.application.routes.draw do
  #API definition
  namespace :api, defaults: { format: :json }, 
                            # Set api under subdomain
                              constraints: { subdomain: 'api' }, path: '/' do 
    #List resources here
  end 
end
