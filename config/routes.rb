Onlypodcast::Application.routes.draw do
		
	get 'onlypodcast/:episode_num', to: redirect('/%{episode_num}') 
	
	match 'admin', :to => 'access#menu'
    
  match 'feeds/:slug', :to => 'feeds#show', :as => 'feed'
  
  resources :personalities

  resources :podcasts

  resources :episodes, :path => 'id'

  get "home/index"

  match 'all' => 'episodes#list', :as => 'episodes_list'
  
  get ':episode_num', to: 'episodes#feature', as: 'feature'
    
  # match 'id/:id', to: 'episodes#inspect', as: 'episode'
  
  #This doesn't work. I'll have to fix it someday if I ever launch another podcast... it needs to be a fallback for the one above...
  # match ':podcast_slug' => 'podcasts#index' 
  
  # Another structure for the site if I ever have more than one podcast
  # match ':podcast_slug/:episode_num' => 'episodes#complex_route'
  
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
  root :to => 'episodes#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
