Auth::Application.routes.draw do
  post "login" => "site#login", :as => :login
  get "logout" => "site#logout", :as => :logout
  
  get "register/:code" => "site#register", :as => :register
  post "register/:code" => "site#create_user"
  
  get "reset/:code" => "site#reset", :as => :register
  post "reset/:code" => "site#set_password"
  
  root :to => 'site#index'
end
