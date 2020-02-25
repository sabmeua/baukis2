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
  end

  namespace :admin do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
    get "staff_members" => "staff_members#index"
    get "staff_members/:id" => "staff_members#show"
    get "staff_members/new" => "staff_members#new"
    get "staff_members/:id/edit" => "staff_members#edit"
    post "staff_members" => "staff_members#create"
    patch "staff_members/:id" => "staff_members#update"
    delete "staff_members/:id" => "staff_members#destroy"
  end

  namespace :customer do
    root "top#index"
  end
end
