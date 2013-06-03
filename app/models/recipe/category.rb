require 'stringex'

module Recipe
  class Category < ActiveRecord::Base
    if Recipe.config.engine_routing
      include Recipe::Engine.routes.url_helpers
    else
      include Rails.application.routes.url_helpers
    end

    self.table_name = "recipe_categories"

    attr_accessible                   :image,
                                      :order,
                                      :text,
                                      :url,
                                      :name,
                                      :item_ids

    has_many                          :categorisations
    has_many                          :items, :through => :categorisations
    accepts_nested_attributes_for     :categorisations

    has_attached_file                 :image,
                                      :styles => {
                                        :main => Recipe.config.main_item_image_size,
                                        :secondary => Recipe.config.secondary_item_image_size,
                                        :thumb => Recipe.config.item_thumb_size
                                      }

    validates_presence_of             :order,
                                      :text,
                                      :name

    validates_uniqueness_of           :name

    default_scope                     :order => '`order` ASC'
    acts_as_url                       :name

    def get_canonical_url
      recipe_category_path(self)
    end

    def to_param
      url
    end

    def to_s
      name
    end
  end
end
