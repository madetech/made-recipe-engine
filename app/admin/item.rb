if defined?(ActiveAdmin) and Recipe.config.engine_active_admin
  ActiveAdmin.register Recipe::Item do

    filter :name
    filter :created_at

    menu :label => "Recipes", :parent => "Recipes", :priority => 1

    action_item :only => :show do
      link_to "View Recipe Item on site", recipe_item.get_canonical_url
    end

    controller do
      cache_sweeper Recipe.config.recipe_item_sweeper if Recipe.config.recipe_item_sweeper
      defaults :finder => :find_by_url
    end

    form do |f|
      f.inputs "Recipe" do
        f.input     :name,
                    :label => 'Recipe name'

        f.input     :image,
                    :hint => f.template.image_tag(f.object.image.url(:thumb))

        f.input     :description
      end

      f.inputs "Recipe Ingredients" do
        f.has_many :ingredients do |f_ingredient|
          f_ingredient.input  :quantity,
                              :hint => 'eg. 10g'
          f_ingredient.input  :name,
                              :label => 'Ingredient'
          f_ingredient.input  :link,
                              :label => 'Link'
        end
      end

      f.inputs "Method" do
        f.input     :method
      end

      f.inputs "Recipe Details" do
        f.input     :prep_time,
                    :label => 'Preperation Time',
                    :hint => 'time in minutes'

        f.input     :cook_time,
                    :label => 'Cook Time',
                    :hint => 'time in minutes'

        f.input     :serves,
                    :label => 'Servings',
                    :hint => 'number of people the recipe feeds'

        f.input     :skill_level,
                    :as => :select,
                    :collection => Recipe::Item::SKILL_LEVELS

        f.input     :order,
                    :hint => 'display order'
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
