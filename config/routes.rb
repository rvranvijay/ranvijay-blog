Rails.application.routes.draw do
  get 'blogposts/index'

resources :blogs 
  resources :posts

  get 'pages/theems'

  get 'pages/downloads'

  get 'pages/app'

  get 'pages/about_us'

  get 'pages/contact_us'

  get 'static_pages/apps'

  get 'static_pages/home'

  get 'static_pages/contact_us'

  devise_for :views
  
devise_for :users, :controllers => { :registrations => "my_devise/registrations",:omniauth_callbacks => "users/omniauth_callbacks" }

  get 'blogs/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'blogs#index'

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
  get '/404', to: 'errors#file_not_found', via: :all
get '/422', to: 'errors#unprocessable', via: :all
get '/500', to: 'errors#internal_server_error', via: :all
  get 'auth/twitter/callback', to: 'sessions#create'

end
