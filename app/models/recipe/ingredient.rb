module Recipe
  class Ingredient < ActiveRecord::Base
    self.table_name = "recipe_ingredients"

    attr_accessible               :item_id,
                                  :name,
                                  :quantity

    belongs_to                    :item

    def to_s
      "#{quanity} - #{name}"
    end
  end

end
