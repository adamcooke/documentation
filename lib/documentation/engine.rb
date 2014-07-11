module Documentation
  class Engine < Rails::Engine
    
    isolate_namespace Documentation
    
    initializer 'shoppe.initialize' do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
    
    generators do
      require 'documentation/generators/route_generator'
    end
    
  end
end
