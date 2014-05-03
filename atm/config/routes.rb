Atm::Application.routes.draw do

  root to: 'login#index'
  
  get "account/index"
  get "account/show"

  post '/authenticate', to: 'login#authenticate', as: 'login_authenticate'
end
