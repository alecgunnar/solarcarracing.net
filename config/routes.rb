Rails.application.routes.draw do
  SEO_NAME_PATTERN = /([0-9]+)[a-z0-9-]*/

  root 'welcome#homepage'

  # Account management
  get '/account', to: 'account#overview', as: 'account'
  get '/account/email-address', to: 'account#email', as: 'account_email'
  get '/account/password', to: 'account#password', as: 'account_password'
  get '/account/profile-information', to: 'account#profile', as: 'account_profile'
  get '/account/profile-picture', to: 'account#picture', as: 'account_picture'

  # Profiles
  get '/profile/:id', to: 'profile#show', as: 'profile', constraints: { id: SEO_NAME_PATTERN }

  # Forums
  get '/forums', to: 'forums#index', as: 'forums'
  get '/forum/:id', to: 'forums#show', as: 'forum', constraints: { id: SEO_NAME_PATTERN }

  # Topics
  get '/topic/:id', to: 'topics#show', as: 'topic', constraints: { id: SEO_NAME_PATTERN }
  get '/topic/start/:forum_id', to: 'topics#start', as: 'start_topic'
  post '/topic/start/:forum_id', to: 'topics#create', as: 'create_topic'
  get '/topic/edit/:id', to: 'topics#edit', as: 'edit_topic'
  post '/topic/edit/:id', to: 'topics#update', as: 'update_topic'

  # Posts
  get '/post/:id', to: 'posts#show', as: 'post'
  get '/post/reply/:topic_id', to: 'posts#reply', as: 'post_reply'
  post '/post/reply/:topic_id', to: 'posts#create', as: 'post_create'
  get '/post/edit/:id', to: 'posts#edit', as: 'post_edit'
  post '/post/edit/:id', to: 'posts#update', as: 'post_update'

  devise_scope :user do
    # Registrations
    get '/sign-up' => 'users/registrations#new', as: 'new_user_registration'
    post '/sign-up' => 'users/registrations#create', as: 'user_registration'

    # Sessions
    get '/sign-in' =>'users/sessions#new', as: 'new_user_session'
    post '/sign-in' => 'users/sessions#create', as: 'user_session'
    delete '/sign-out' => 'users/sessions#destroy', as: 'destroy_user_session'
  end

  devise_for :users, skip: [:sessions, :registrations], controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }
end
