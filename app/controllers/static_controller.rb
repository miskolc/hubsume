class StaticController < ApplicationController
  skip_before_filter :authenticate_user!
  layout :choose_layout
  
  def index
  end
  
  private
  def choose_layout
    if [:index].include?(params[:action].to_sym)
      'landing'
    else
      'application'
    end
  end
end
