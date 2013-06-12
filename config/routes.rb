Auth::Application.routes.draw do
  post "login" => "site#login", :as => :login
  get "logout" => "site#logout", :as => :logout
  
  get "naughty" => "site#do_something_naughty"
  
  root :to => 'site#index'
end
