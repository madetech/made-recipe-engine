Recipe.config do |config|
  config.recipe_item_sweeper = false
  config.recipe_category_sweeper = false
  config.engine_routing = true
  config.engine_active_admin = true
  config.main_item_image_size = "466x377#"
  config.secondary_item_image_size = "231x150#"
  config.item_thumb_size = "70x70#"
  config.skill_levels = [
      ["Easy", "easy"],
      ["Moderate", "moderate"],
      ["Hard", "hard"]
    ]
end
