Rails.application.routes.draw do
  root 'welcome#homepage'

  # Profiles
  get '/profile/:seo_name', to: 'profile#show', as: 'profile', constraints: { seo_name: SEO.valid_chars_pattern }

  # The forums
  get '/forums', to: 'forums#index', as: 'forums'
  get '/forum/:seo_name', to: 'forums#show', as: 'forum'

  get 'topic/:seo_name', to: 'topics#show', as: 'topic', constraints: { seo_name: /[a-z0-9\-]+/ }

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }
end
