Rails.application.routes.draw do
  root to: 'users#show'
  devise_for :users
end
