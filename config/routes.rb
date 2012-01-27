Contabilizacion::Application.routes.draw do
  get "llamadas/modificar"

  devise_for :usuarios, :path => "usuarios", :only => [:sessions], :path_names => { :sign_in => 'login', :sign_out => 'logout'}

  resources :llamadas, :only => :update
  resources :centros, :only => [:index, :show, :update]
  get '/centros/:id/abrir' => 'centros#abrir', :as => 'abrir_centro'
  get '/centros/:id/cerrar' => 'centros#cerrar', :as => 'cerrar_centro'
  get '/centros/:id/control' => 'centros#control', :as => 'centro_control'
  get '/llamada/:id/modificar' => 'llamadas#modificar', :as => 'modificar_llamada'

  get '/admin/crear_usuario' => 'admins#crear_usuario', :as => 'crear_usuario'
  post '/admin/crear_usuario' => 'admins#new_usuario', :as => 'new_usuario'
  get '/admin/usuarios' => 'admins#usuarios', :as => 'usuarios'
  
  get '/admin/centros' => 'admin#centros', :as => 'admin_centros'
  get '/admin/reasignar_centros' => 'admins#reasignar_centros', :as => 'reasignar_centros'
  get '/admin/reasignar_centros_del_conector' => 'admins#reasignar_centros_del_conector', :as => 'reasignar_centros_del_conector'
  get '/admin/:id/asignar_centro_a_conector' => 'admins#asignar_centro_a_conector', :as => 'asignar_centro_a_conector'
  put '/admin/:id/update_centro' => 'admins#update_centro', :as => 'update_centro'
    
  root :to => 'centros#index'
  
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
