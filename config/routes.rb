Ticketee::Application.routes.draw do



  devise_for :users, :controllers => { :registrations => "registrations" }
  get '/awaiting_confirmation', :to => "users#confirmation", :as => 'confirm_user'



  # This code tells the routing for Rails that you have a tickets resource nested inside the
  # projects resource. Effectively, any time you access a ticket resource, you access it within
  # the scope of a project too. Just as the resources :projects method gave you helpers to
  # use in controllers and views, this nested one gives you helpers.
  #
  resources :projects do
    resources :tickets
  end

  resources :tickets do
    resources :comments
    # pg 301:
    resources :tags do
      member do
        delete :remove
      end
    end
  end

  root :to => 'projects#index'

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end


    # pg 275
    resources :states do
      member do
        get :make_default
      end
    end

  end

  # pg 203
  put '/admin/users/:user_id/permissions',
    :to => 'admin/permissions#update',
    :as => :update_user_permissions


  # pg 229
  resources :files

end
