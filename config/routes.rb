Treebook::Application.routes.draw do

  resources :memberships


root to: "merchants#index"
get 'merchants/setup', to: 'merchants#setup'
resources :merchants, :credits, :profiles, :categories, :rewards


get 'qrcode/:id', to: 'qrcodes#show'
get 'add_credit_to_user/:id/:type', to: 'credits#new' 
get 'faqs', to: 'profiles#faqs'
get 'terms', to: 'profiles#terms'
get 'home', to: 'staticpages#home'
get 'credits/all/:id', to: 'credits#all'
get 'myaccount', to: 'profiles#account'
get 'send_email', to: 'mails#send_email'
get 'create_expired_lines', to: 'credits#create_expired_lines'
get 'stats', to: 'stats#show'
get 'prints', to: 'prints#all'

# get 'users/:id', to: 'users#show'

devise_for :users



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
