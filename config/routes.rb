AnimalRescueHub::Application.routes.draw do
	root :to => "application#coming_soon"
 #  ActiveAdmin.routes(self)

 #  devise_for :admin_users, ActiveAdmin::Devise.config

	# resources :animals, :only => [:index, :show]
 #  resources :users

 #  root :to => 'application#index'

 #  match "privacy_policy"  => 'pages#privacy_policy'
 #  match "signup"          => 'users#new'

end

#== Route Map
# Generated on 30 Apr 2013 12:55
#
# batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format) admin/admin_users#batch_action
#              admin_admin_users GET        /admin/admin_users(.:format)              admin/admin_users#index
#                                POST       /admin/admin_users(.:format)              admin/admin_users#create
#           new_admin_admin_user GET        /admin/admin_users/new(.:format)          admin/admin_users#new
#          edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)     admin/admin_users#edit
#               admin_admin_user GET        /admin/admin_users/:id(.:format)          admin/admin_users#show
#                                PUT        /admin/admin_users/:id(.:format)          admin/admin_users#update
#                                DELETE     /admin/admin_users/:id(.:format)          admin/admin_users#destroy
#     batch_action_admin_animals POST       /admin/animals/batch_action(.:format)     admin/animals#batch_action
#                  admin_animals GET        /admin/animals(.:format)                  admin/animals#index
#                                POST       /admin/animals(.:format)                  admin/animals#create
#               new_admin_animal GET        /admin/animals/new(.:format)              admin/animals#new
#              edit_admin_animal GET        /admin/animals/:id/edit(.:format)         admin/animals#edit
#                   admin_animal GET        /admin/animals/:id(.:format)              admin/animals#show
#                                PUT        /admin/animals/:id(.:format)              admin/animals#update
#                                DELETE     /admin/animals/:id(.:format)              admin/animals#destroy
#                admin_dashboard            /admin/dashboard(.:format)                admin/dashboard#index
#    batch_action_admin_comments POST       /admin/comments/batch_action(.:format)    admin/comments#batch_action
#                 admin_comments GET        /admin/comments(.:format)                 admin/comments#index
#                                POST       /admin/comments(.:format)                 admin/comments#create
#                  admin_comment GET        /admin/comments/:id(.:format)             admin/comments#show
#         new_admin_user_session GET        /admin/login(.:format)                    active_admin/devise/sessions#new
#             admin_user_session POST       /admin/login(.:format)                    active_admin/devise/sessions#create
#     destroy_admin_user_session DELETE|GET /admin/logout(.:format)                   active_admin/devise/sessions#destroy
#            admin_user_password POST       /admin/password(.:format)                 active_admin/devise/passwords#create
#        new_admin_user_password GET        /admin/password/new(.:format)             active_admin/devise/passwords#new
#       edit_admin_user_password GET        /admin/password/edit(.:format)            active_admin/devise/passwords#edit
#                                PUT        /admin/password(.:format)                 active_admin/devise/passwords#update
#                        animals GET        /animals(.:format)                        animals#index
#                         animal GET        /animals/:id(.:format)                    animals#show
#                          users GET        /users(.:format)                          users#index
#                                POST       /users(.:format)                          users#create
#                       new_user GET        /users/new(.:format)                      users#new
#                      edit_user GET        /users/:id/edit(.:format)                 users#edit
#                           user GET        /users/:id(.:format)                      users#show
#                                PUT        /users/:id(.:format)                      users#update
#                                DELETE     /users/:id(.:format)                      users#destroy
#                           root            /                                         application#index
#                 privacy_policy            /privacy_policy(.:format)                 pages#privacy_policy
#                         signup            /signup(.:format)                         pages#signup
