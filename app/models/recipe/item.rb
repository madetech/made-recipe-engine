require 'stringex'

module Recipe
  class Item < ActiveRecord::Base
    if Recipe.config.engine_routing
      include Recipe::Engine.routes.url_helpers
    else
      include Rails.application.routes.url_helpers
    end

    self.table_name = "recipe_items"

    has_many                        :categorisations
    has_many                        :categories, :through => :categorisations
    accepts_nested_attributes_for   :categorisations, :allow_destroy => true

    has_many                        :ingredients
    accepts_nested_attributes_for   :ingredients, :allow_destroy => true

    attr_accessible                 :image,
                                    :description,
                                    :order,
                                    :method,
                                    :url,
                                    :name,
                                    :category_ids,
                                    :prep_time,
                                    :cook_time,
                                    :serves,
                                    :ingredient_ids,
                                    :ingredients_attributes,
                                    :video

    has_attached_file               :image,
                                    :styles => {
                                      :main => Recipe.config.main_item_image_size,
                                      :secondary => Recipe.config.main_item_image_size,
                                      :thumb => Recipe.config.main_item_image_size
                                    }

    validates_presence_of           :order,
                                    :method,
                                    :name,
                                    :description,
                                    :prep_time,
                                    :cook_time

    validates_uniqueness_of         :name

    validates_attachment_presence   :image

    acts_as_url                     :name

    default_scope                   :order => '`order` ASC'

    def in_category(category_slug)
      begin
        category = Category.find_by_url!(category_slug)
      rescue => error
        return false
      end
      self.categories.include?(category)
    end

    def get_canonical_url
      recipe_category_item_path(self.categories.first, self)
    end

    def get_shopping_list_url
      recipe_shopping_list_path(self.categories.first, self)
    end

    def get_related_category_recipes(category_id, num)
      recipes_in_category = Recipe::Categorisation.where(:category_id => category_id).map(&:item_id)
      recipes_in_category.delete(self.id)
      RecipeItem.where(:id => recipes_in_category).limit(num)
    end

    def to_param
      url
    end

    def to_s
      name
    end
  end
end
