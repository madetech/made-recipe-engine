require "recipe/engine"

module Recipe
  class Engine < Rails::Engine
    # TODO isolate_namespace Recipe

    initializer :recipe do
      ActiveAdmin.application.load_paths.unshift Dir[Recipe::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
    end
  end

  def self.config(&block)
    @@config ||= Recipe::Engine::Configuration.new

    # @@config.engine_routing = true

    yield @@config if block

    return @@config
  end
end
