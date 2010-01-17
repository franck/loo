ActionController::Routing::Routes.draw do |map|
  map.resources :landscapes
  map.resources :players

  map.filter "locale"

  map.resource :user_session
  map.root :controller => "landscapes"
  
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.resource :account, :controller => "users"

  map.resources :users, :member => {
    :edit_sight => :get
  }
  

end
