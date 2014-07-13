module Documentation
  class Engine < Rails::Engine
    
    isolate_namespace Documentation
    
    initializer 'shoppe.initialize' do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
      
      # Load view helpers for the base application
      ActiveSupport.on_load(:action_view) do
        ActionView::Base.send :include, Documentation::ViewHelpers
      end
    end
    
    generators do
      require 'documentation/generators/route_generator'
    end
    
    def self.mounted_path
      if route = Rails.application.routes.routes.select { |r| r.app == self }.first
        route.path.spec.to_s
      end
    end
    
  end
end
