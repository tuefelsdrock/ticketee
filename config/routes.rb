Ticketee::Application.routes.draw do

  # This code tells the routing for Rails that you have a tickets resource nested inside the
  # projects resource. Effectively, any time you access a ticket resource, you access it within
  # the scope of a project too. Just as the resources :projects method gave you helpers to
  # use in controllers and views, this nested one gives you helpers.
  #
  resources :projects do
    resources :tickets
  end

  root :to => 'projects#index'

end
