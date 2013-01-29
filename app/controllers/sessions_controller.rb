class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def create
    auth = request.env['omniauth.auth']
    
    user = User.find_by_email_and_uid(auth["info"]["email"], auth["uid"])
    
    if user.nil?
      user = User.new(:email => auth["info"]["email"])
      user.nickname = auth["info"]["nickname"]
      user.uid = auth["uid"]
      user.urls = auth["info"]["urls"]
    end

    user.token = auth["credentials"]["token"]
    user.save
    
    session[:user_identifier] = user.identifier
    redirect_to '/'
  end
end