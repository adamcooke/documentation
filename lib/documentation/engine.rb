# frozen_string_literal: true

module Documentation
  class Engine < Rails::Engine

    isolate_namespace Documentation

    initializer 'documentation.initialize' do |app|
      # Load view helpers for the base application
      ActiveSupport.on_load(:action_view) do
        ActionView::Base.include Documentation::ViewHelpers
      end
    end

    initializer 'documentation.assets.precompile' do |app|
      app.config.assets.precompile += %w[documentation/application.css documentation/application.js]
    end

    generators do
      require 'documentation/generators/setup_generator'
    end

    def self.mounted_path
      if route = Rails.application.routes.routes.select { |r| (r.app == self) || (r.app.try(:app) == self) }.first
        route.path.spec.to_s
      end
    end

  end
end
