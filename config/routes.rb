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
  
  resources :work_histories
  resources :users, :only => [:edit, :update, :show] do
    member do
      get :dashboard
    end
  end
  
  root :to => "home#index"
end
