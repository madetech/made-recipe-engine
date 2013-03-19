module Recipe
  class Categorisation < ActiveRecord::Base
    self.table_name = "recipe_categorisations"

    attr_accessible               :item_id,
                                  :category_id

    belongs_to                    :item
    belongs_to                    :category

    def to_s
      self.category
    end
  end
end
