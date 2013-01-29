module Authenticable
  extend ActiveSupport::Concern

  included do
    before_save :update_identifier
    
    private
    def update_identifier
      identifier = "#{self.email}.#{self.nickname}.#{self.uid}.#{rand(100000000000)}"
      self.identifier = Digest::SHA1.hexdigest(identifier)
    end
  end
end