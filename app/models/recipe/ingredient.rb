module Recipe
  class Ingredient < ActiveRecord::Base
    self.table_name = "recipe_ingredients"

    attr_accessible               :item_id,
                                  :name,
                                  :quantity,
                                  :link

    belongs_to                    :item

    def to_s
      "#{quantity} - #{name}"
    end
  end
end
