require 'rails/generators'

module Documentation
  module Generators
    class SetupGenerator < Rails::Generators::Base
      
      def create_route
        route 'mount Documentation::Engine => "/docs"'
      end

    end
  end
end
