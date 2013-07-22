require "recipe/engine"

module Recipe
  mattr_accessor :recipe_item_sweeper
  @@recipe_item_sweeper = false

  mattr_accessor :recipe_category_sweeper
  @@recipe_category_sweeper = false

  mattr_accessor :engine_routing
  @@engine_routing = true

  mattr_accessor :engine_active_admin
  @@engine_active_admin = true

  mattr_accessor :main_item_image_size
  @@main_item_image_size = "466x377#"

  mattr_accessor :secondary_item_image_size
  @@secondary_item_image_size = "231x150#"

  mattr_accessor :item_thumb_size
  @@item_thumb_size = "70x70#"

  mattr_accessor :skill_levels
  @@skill_levels = [
      ["Easy", "easy"],
      ["Moderate", "moderate"],
      ["Hard", "hard"]
    ]

  class Engine < Rails::Engine
    isolate_namespace Recipe

    initializer :recipe do
      ActiveAdmin.application.load_paths.unshift Dir[Recipe::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
    end
  end

  def self.config(&block)
    yield self if block
    return self
  end
end
