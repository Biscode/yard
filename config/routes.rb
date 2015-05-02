Rails.application.routes.draw do
<<<<<<< HEAD
  

  
 
resources :comments
resources :tasks do
resources :comments
end
=======
>>>>>>> 5a82131bac7b64ab6648acfb5274a394c7933855

  resources :announcements

<<<<<<< HEAD
  resources :announcements

=======

  
 
resources :comments
resources :tasks do
resources :comments


  resources :announcements
resources :sessions
devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
>>>>>>> 9f2c97bc72af4b61744a89ff44e8832931281faf
root 'projects#index'


  devise_scope :user do 
   # root to: 'static_pages#home'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
        match '/sessions/user.new', to: 'devise/sessions#create', via: :post

end
devise_scope :user do
  get "sign_in", to: "devise/sessions#new"
end
 # root 'projects#index'
get 'projects/index'
#match ':users(/:search(/:))'

<<<<<<< HEAD
get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
=======

>>>>>>> 2a4e3ffb73c1609b70fcfec2318d759011c7b955
#get "users/search"
resources :teams
resources :sprints
resources :notifications

# resources :tasks

resources :projects do
<<<<<<< HEAD
  resources :tasks
  resources :sprints
=======
<<<<<<< HEAD
 resources :announcements
  resources :sprints do
    resources :tasks
  end
=======
  resources :tasks
  resources :sprints
>>>>>>> 9f2c97bc72af4b61744a89ff44e8832931281faf
>>>>>>> 2a4e3ffb73c1609b70fcfec2318d759011c7b955
  resources :teams do
    resources :users do
      member do
        get 'add_user_to_team'
      end
    end
  end
<<<<<<< HEAD
<<<<<<< HEAD
root 'projects#index'
=======
  resources :users
end

resources :tasks
resources :sprints
resources :teams
resources :users
resources :notifications
resources :sessions

get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"

# to route to the add_task_to_user
  match 'add_task_to_user_task_user' => 'users#add_task_to_user', :as =>'add_task_to_user',via: [:get, :post]



>>>>>>> 5a82131bac7b64ab6648acfb5274a394c7933855
=======

>>>>>>> 2a4e3ffb73c1609b70fcfec2318d759011c7b955
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
