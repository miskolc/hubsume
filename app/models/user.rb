class User < ActiveRecord::Base
  include Authenticable
  include Hubable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :nickname, :urls
  
  validates_presence_of :email, :on => :update, :message => "can't be blank"
end
