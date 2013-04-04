if defined?(ActiveAdmin) and Recipe.config.engine_active_admin
  ActiveAdmin.register Recipe::Category do

    filter :name
    filter :created_at

    menu :label => "Categories", :parent => "Recipes", :priority => 2

    action_item :only => :show do
      link_to "View Recipe Category on site", recipe_category_path(recipe_category.url)
    end

    controller do
      cache_sweeper Recipe.config.recipe_category_sweeper if Recipe.config.recipe_category_sweeper
      defaults :finder => :find_by_url
    end

    form do |f|
      f.inputs "Category" do
        f.input     :name,
                    :label => 'Recipe category name'

        f.input     :image,
                    :hint => f.template.image_tag(f.object.image.url(:thumb))

        f.input     :text

        f.input     :order
      end

      f.actions
    end

    index do
      column :name
      column :created_at
      column :updated_at

      default_actions
    end
  end
end
