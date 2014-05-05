Atm::Application.routes.draw do

  root to: 'login#index'
  
  get "/accounts", to: 'account#index', as: 'account_index'
  get '/accounts/:id', to: 'account#show', as: 'account_show'
  post '/accounts/:id/withdraw', to: 'account#withdraw', as: 'account_withdraw'

  post '/authenticate', to: 'login#authenticate', as: 'login_authenticate'
end
