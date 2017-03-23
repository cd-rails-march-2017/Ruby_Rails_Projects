Rails.application.routes.draw do
  root 'event#index'

# User GET Requests
  get 'user/index'
  get 'user/edit'
  get 'user/logout'

# User POST Requests
  post 'user/create'
  post 'user/login'
  post 'user/submit'

# Event GET Requests
  get 'event/index'
  get 'event/detail/:id' => "event#detail"
  get 'event/edit/:id' => "event#edit"
  get 'event/delete/:id' => "event#delete"
  #Is it bad practice to do this with a GET Method??? I am using an href link to direct here....

# Event POST Requests
  post 'event/create'
  post 'event/update/:id' => "event#update"

# Attendee GET Requests
  get 'attendee/join/:id' => 'attendee#join'
  get 'attendee/cancel/:id'=> 'attendee#cancel'
  #Is it bad practice to do this with a GET Method??? I am using an href link to direct here....

# Message Post Requests
  post 'message/create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
