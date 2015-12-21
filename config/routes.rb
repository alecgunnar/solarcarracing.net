Rails.application.routes.draw do
  root 'welcome#homepage'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
