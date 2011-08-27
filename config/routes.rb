TechCredentials::Application.routes.draw do
  # -------------- Authentication routes -------------------
    devise_for :users , :controllers => { :omniauth_callbacks => "devise/omniauth" }
    devise_scope :user do
      get '/users/auth/:provider' => 'devise/omniauth#passthru'
    end
  # --------------------------------------------------------
  
  root :to => "home#index"
end
