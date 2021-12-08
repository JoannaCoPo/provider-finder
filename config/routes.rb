Rails.application.routes.draw do
  get '/provider_search', to: 'providers#search'
  get '/provider_results', to: 'providers#index'
  get '/search_tips', to: 'providers#search_tips'
end

# consider more specific naming for search route
