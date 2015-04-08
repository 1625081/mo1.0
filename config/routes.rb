Rails.application.routes.draw do
  resources :dmvideos
  resources :articles

  resources :images

  resources :musics do
    resources :comments
  end
  resources :videos do
    resources :comments
  end
  get 'youku' => 'videos#upload', as: :upload_to_youku


  post 'images/qiniu_callback' => 'images#qiniu_callback'

  get 'profile' => "profile#index"
  get 'profile/follow'
  get 'profile/unfollow'
  get 'search' => "home#search",as: :search_items
  get 'profile/:id' => "profile#show", as: :show_profile
  get 'profile/:id/detail' => "profile#detail", as: :profile_detail
  get 'profile/:id/edit' => "profile#edit", as: :edit_profile
  post 'profile/:id/edit' => "profile#edit"
  patch 'profile/:id/edit' => "profile#edit"
  get 'profile/:id/all' => "profile#all",as: :profile_all

  #get 'edit' => "profile#edit"
  #post 'edit' => "profile#edit"
  #patch 'edit' => "profile#edit"

  patch 'profile' => "profile#update"
  put 'profile' => "profile#update"
  get 'verify' => "profile#verify_identity", as: :verify_identity
  get 'all_user' => "profile#all_user"
  get 'list' => "profile#list"

  root 'home#test',as: :home
  get 'timeline' => 'home#timeline'

  
  get 'upload' => 'videos#upload'
  get 'video' => 'home#video'
  get 'music' => 'musics#new'


  namespace :api do
    namespace :v1 do
      get 'score' => 'score#get_score'
      get 'score/like'
      get 'score/favor'
      get 'score/unlike'
      get 'score/unfavors'
      get 'test/notice'
      get 'test/warning'
      post 'upload/image'
    end
  end

  devise_for :users
  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :sign_out
  end
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

