TechCredentials::Application.routes.draw do
  # -------------- Authentication routes -------------------
    devise_for :users , :controllers => { :omniauth_callbacks => "devise/omniauth" }
    devise_scope :user do
      get '/users/auth/:provider' => 'devise/omniauth#passthru'
    end
  # --------------------------------------------------------
  resources :skills do
    collection do
      get :mass_input
      post :mass_create
    end
  end
  
  resources :messages do
    collection do
      get :sent
    end
  end
  
  get "/invites/invite_friends" => "invites#invite_friends", :as => :invite_friends
  post "/invites/import" => "invites#import", :as => :import
  post "/invites/invite" => "invites#invite", :as => :invite
  
  get "/auth/index" => "auth#index", :as => :index
  get "/auth/callback" => "auth#callback", :as => :callback
  
  get "/search/search" => "search#search", :as => :search
  get "/search/result" => "search#result", :as => :result
  
  resources :educations do
    collection do
      get :mass_input
      post :mass_create
    end
  end

  resources :work_histories
  resources :educations
  resources :users, :only => [:edit, :update, :show] do
    member do
      get :dashboard
    end
  end

  root :to => "home#index"
end
