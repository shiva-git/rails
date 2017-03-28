Rails.application.routes.draw do
  
get '/' =>'api#home'
get 'api/all_classes' => 'student#findUnregisteredClasses'

get 'api/class' => 'gradclass#displayClassForm'
post 'api/class' => 'gradclass#create'

get 'api/class/students' => 'gradclass#displayfindStudentsForm'
post 'api/class/students' => 'gradclass#allStudents'

get 'api/class/professor' => 'gradclass#displayfindClassProfessorForm'
post 'api/class/professor' => 'gradclass#findClassProf'

get 'api/class/:id' => 'gradclass#classdetails'


get 'api/class/:id/register' => 'registration#displayRegisterForm'
post 'api/class/:id/register' => 'registration#register'

get 'api/class/:id/unregister' => 'registration#displayUnRegisterForm'
post 'api/class/:id/unregister' => 'registration#unregister'


get 'api/student/professors' => 'student#displayfindProfessorsForm'
post 'api/student/professors' => 'student#findProfessors'

get 'api/student/classes' => 'student#displayfindClassesForm'
post 'api/student/classes' => 'student#findClasses'

get 'api/student/classmates' => 'student#displayfindClassmatesForm'
post 'api/student/classmates' => 'student#findClassmates'


get '*path' => 'api#noroute'



 #get 'api/class' => 'api#displayform'
 
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
