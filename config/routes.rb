Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root to: 'home#index'

  get 'edit_profile/:id', to: 'profiles#edit_profile', as: 'edit_profile'
  put 'update_profile/:id', to: 'profiles#update_profile', as: 'update_profile'
  get 'advantage/:id', to: 'advantages#show', as: 'advantage'
  get '/projects/:alias', to: 'projects#show', as: 'projects'
  post '/feedback', to: 'feedback#send_feedback'
  resources :subscribers, only: :create


  namespace :admin do
    root to: 'home#index'
    resources :menus
    resources :materials
    resources :tags, except: :show
    resources :users, only: %i[index edit update]
    resources :sliders, except: :show
    resources :articles
    resources :videos
    resources :advantages
    resources :projects
    resources :potential_investors, only: %i[index show]
    resources :submission_projects, only: %i[index show]
    resources :contents, only: %i[index edit update]
    resources :departments
    resources :teams
    resources :reviews
    resources :block_materials
    resources :balancers
    resources :sectors, exept: %i[show]
    resources :trips, exept: %i[show]
    resources :landmarks, exept: %i[show]
    resources :period_events, exept: %i[show]
    resources :abouts, exept: %i[show new create]
  end

  namespace :cabinet do
    root to: 'home#index'
    resources :production_areas
    resources :land_areas
    resources :office_areas
    resources :communal_areas
    get 'geo_json/:model/:id', to: 'geo_json#index'
    resources :users, only: %i[index edit update]
    resources :map_layers, except: %i[show]
    resources :potential_investors, only: %i[index show]
    resources :submission_projects, only: %i[index show]
    resources :balancers
    resources :area_logs, only: :index
    resources :communal_areas
    resources :transports
    resources :ownerships
    resources :infrastructure_types
    resources :invest_projects
    resources :map_layer_groups
  end

  namespace :api do
    namespace :v1 do
      resources :map_objects, only: :index
      get '/map_objects/:model/:id', to: 'map_objects#show'
      get '/layer_links', to: 'map_objects#layer_links'
    end
  end

  scope '(:locale)', locale: /uk|en/ do
    get '/guide', to: 'home#guide'
    get '/tourism', to: 'home#tourism'
    get '/about', to: 'abouts#index'
    get 'geo_json_gis', to: 'maps#geo_json_gis', as: :geo_json_gis
    get 'init_map_layers', to: 'maps#map_layers', as: :init_map_layers
    get 'select_object_info', to: 'invest_maps#select_object_info', as: :select_object_info
    root to: 'home#index'
    resources :invest_maps, only: :index
    resources :production_areas, only: :show
    resources :land_areas, only: :show
    resources :office_areas, only: :show
    resources :communal_areas, only: :show
    resources :invest_projects, only: :show
    resources :projects, only: :index
    resources :landmarks, only: :index
    get '/projects/:alias', to: 'projects#show'
    resources :sectors, only: %i[index]
    get 'articles', to: 'articles#index', as: :articles
    get 'articles/:id', to: 'articles#show', as: :article
    resources :user_land_areas, only: :create
    resources :potential_investors, only: :create
    get 'reviews', to: 'reviews#index', as: 'reviews'
    resources :submission_projects, only: :create
    get 'our_team', to: 'teams#index', as: 'our_team'
    get '/search', to: 'elastic#search', as: :search
    resources :materials, only: %i[index]
    resources :materials, only: :show, path: '/'
  end

  match '*path', to: 'application#not_found', via: :all
end
