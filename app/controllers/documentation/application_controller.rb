module Documentation
  class ApplicationController < ActionController::Base

    rescue_from Documentation::AccessDeniedError do |e|
      render :template => 'documentation/shared/access_denied', :layout => false
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render :template => 'documentation/shared/not_found', :layout => false
    end

    before_filter do
      unless authorizer.can_use_ui?
        render :template => 'documentation/shared/not_found', :layout => false
      end
    end

    private

    def authorizer
      @authorizer ||= Documentation.config.authorizer.new(self)
    end

    helper_method :authorizer

  end
end
