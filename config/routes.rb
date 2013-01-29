Hubsume::Application.routes.draw do
  root :to => 'users#dashboard', :constraints => lambda {|req| !req.session[:user_identifier].blank? }
  root :to => 'static#index'
  
  get '/auth/:provider/callback', to: 'sessions#create', as: "omniauth"
end
