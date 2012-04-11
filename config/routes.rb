Itsjaredc::Application.routes.draw do

  resources :logs
  resources :farmings
  resources :lesson_plantations
  resources :user_knowledge_states
  resources :sessions
  resources :users
  resources :knowledges
  resources :password_resets

  root :to => "knowledges#home"
  match "access_denied" => "pages#access_denied"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "home/home"
  get "admin" => "home#index", :as => "admin"
  get "home/index"
  get "home/input_scrape_knowledge"
  get "list" => "knowledges#knowledges_providers", :as => "list"
  get "search" => "knowledges#home"
  get "add_lesson_plan" => "lesson_plantations#new", :as => "add_lesson_plan"
  get "add_knowledge" => "home#index", :as => "add_knowledge"
  get "me" => "users#me", :as => "me"

#  resources :subcategorizations
#  resources :categorizations
#  resources :subcategories
#  resources :categories
#  resources :tags
#  resources :providers

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
  # match ':controller(/:action(/:id(.:format)))'
end
