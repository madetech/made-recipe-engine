class AddIndexesToRecipeCategorisations < ActiveRecord::Migration
  def change
    add_index :recipe_categorisations, :item_id
    add_index :recipe_categorisations, :category_id
  end
end
