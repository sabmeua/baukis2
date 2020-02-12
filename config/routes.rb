Rails.application.routes.draw do

  # @note The symbol specified by namespace method corresponds to a module.
  #       namespace :staff { root 'top#index' } --> Staff::TopController#index

  namespace :staff do
    root "top#index"
  end

  namespace :admin do
    root "top#index"
  end

  namespace :customer do
    root "top#index"
  end
end
