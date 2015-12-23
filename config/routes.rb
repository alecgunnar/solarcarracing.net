Rails.application.routes.draw do
  SEO_NAME_PATTERN = /([0-9]+)[a-z0-9-]*/

  root 'welcome#homepage'

  # Profiles
  get '/profile/:id', to: 'profile#show', as: 'profile', constraints: { id: SEO_NAME_PATTERN }

  # The forums
  get '/forums', to: 'forums#index', as: 'forums'
  get '/forum/:id', to: 'forums#show', as: 'forum', constraints: { id: SEO_NAME_PATTERN }

  get 'topic/:id', to: 'topics#show', as: 'topic', constraints: { id: SEO_NAME_PATTERN }

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }
end
