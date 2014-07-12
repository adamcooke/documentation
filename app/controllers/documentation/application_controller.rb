module Documentation
  class ApplicationController < ActionController::Base
    
    private
    
    def authorizer
      @authorizer ||= Documentation.config.authorizer.new(self)
    end
    
    helper_method :authorizer
    
  end
end
