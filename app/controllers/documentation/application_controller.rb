module Documentation
  class ApplicationController < ActionController::Base
    
    rescue_from Documentation::AccessDeniedError do |e|
      render :template => 'documentation/shared/access_denied', :layout => false
    end
    
    private
    
    def authorizer
      @authorizer ||= Documentation.config.authorizer.new(self)
    end
    
    helper_method :authorizer
    
  end
end
