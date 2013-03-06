require 'stringex'

module Recipe
  class Category < ActiveRecord::Base
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
                                        :large => ["500x500>", :jpg],
                                        :small => ["250x250>", :jpg],
                                        :thumb => ["70x70>", :jpg]
                                      }

    validates_presence_of             :order,
                                      :text,
                                      :name

    validates_uniqueness_of           :name

    default_scope                     :order => '`order` ASC'
    acts_as_url                       :name

    def self.with_recipes
      where(:id => Recipe::Categorisation.select(:category_id).uniq)
    end

    def to_param
      url
    end

    def to_s
      name
    end

  end
end
