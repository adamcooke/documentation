require 'rails/generators'

module Documentation
  module Generators
    class RouteGenerator < Rails::Generators::Base
    
      def create_route
        route 'mount Documentation::Engine => "/docman"'
      end

    end
  end
end
