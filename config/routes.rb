Rails.application.routes.draw do
  root 'welcome#homepage'

  # Profiles
  get '/profile/:seo_name', to: 'profile#show', as: 'profile', constraints: { seo_name: /[a-z]+/ }

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }
end
