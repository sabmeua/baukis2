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
      resources :staff_members do
        resources :staff_events, only: [ :index ]
        # @note The "resources" inside of the other resources block are called nested resources.
        #       It defines below routing in this case.
        #       method: GET, path: /admin/staff_members/:staff_member_id/staff_events, action: index
      end
      resources :staff_events, only: [ :index ]
      # @note "resources" method adds 7 actions that is same as the previous commit.
      #       Also it can restrict the actions by specifying argument :only and :except.
    end
  end

  constraints host: config[:customer][:host] do
    namespace :customer, path: config[:customer][:path] do
      root "top#index"
    end
  end
end
