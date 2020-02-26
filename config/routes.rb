Rails.application.routes.draw do
  # @note Loading the config of config/initializers/baukis2.rb
  config = Rails.application.config.baukis2

  constraints host: config[:staff][:host] do
    # @note The symbol specified by namespace method corresponds to a module.
    #       namespace :staff { root 'top#index' } --> Staff::TopController#index
    namespace :staff, path: config[:staff][:path] do
      root "top#index"
      # @note Giving the "as" option allows to name the routing,
      #       then it will be able to access as :staff_login in ERB template.
      get "login" => "sessions#new", as: :login
      resource :session, only: [ :create, :destroy ]
      resource :account, except: [ :new, :create, :destroy ]
    end
  end

  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
      root "top#index"
      get "login" => "sessions#new", as: :login
      resource :session, only: [ :create, :destroy ]
      resources :staff_members
      # @note "resources" method adds 7 actions that is same as the previous commit.
      #       Also it can restrict the actions by specifying argument :only and :except.
    end
  end

  namespace :customer do
    root "top#index"
  end
end
