Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/surgeries', to: 'surgeries#index'
  get '/surgeries/:id', to: 'surgeries#show'
  patch '/surgeries/:id', to: 'surgeries#show'
end
