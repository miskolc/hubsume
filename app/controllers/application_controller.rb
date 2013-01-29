class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :setup_current_user, :authenticate_user!
  
  attr_reader :current_user
  helper_method :current_user, :user_signed_in?
  def user_signed_in?; ! @current_user.nil? end
    
  def signout
    session.delete(:user_identifier)
  end
  
  def authenticate_user!
    if ! user_signed_in?
      signout
      return redirect_to "/"
    end
  end
  
  private
  def setup_current_user
    identifier = session[:user_identifier]
    if ! identifier.nil?
      @current_user = User.find_by_identifier(identifier)
    end
  end
end
