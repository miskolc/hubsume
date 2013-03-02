module Hubable
  extend ActiveSupport::Concern
  
  included do
    def github(mod = Github)
      token = self.token
      github = mod.new do |config|
        config.endpoint    = 'https://api.github.com'
        config.oauth_token = token
        config.adapter     = :net_http
        config.ssl         = {:verify => false}
      end
    end
  end
end