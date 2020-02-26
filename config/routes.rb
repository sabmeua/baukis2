Rails.application.routes.draw do

  # @note The symbol specified by namespace method corresponds to a module.
  #       namespace :staff { root 'top#index' } --> Staff::TopController#index

  namespace :staff do
    root "top#index"
    # @note Giving the "as" option allows to name the routing,
    #       then it will be able to access as :staff_login in ERB template.
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
    resource :account, except: [ :new, :create, :destroy ]
  end

  namespace :admin do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
    resources :staff_members
    # @note "resources" method adds 7 actions that is same as the previous commit.
  end

  namespace :customer do
    root "top#index"
  end
end
