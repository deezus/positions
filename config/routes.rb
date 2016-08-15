Rails.application.routes.draw do
  resources :traders, :actions, :transactions
  root 'traders#index'
end
