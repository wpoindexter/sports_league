Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  devise_scope :user do
    root to: 'users/sessions#new'
    get '/users/parent/sign_up', to: 'users/registrations#parent'
    get '/users/player/sign_up', to: 'users/registrations#player'
    get '/users/coach/sign_up', to: 'users/registrations#coach'
  end

  get '/users/dashboard' => 'users#show', as: :user_root
end
