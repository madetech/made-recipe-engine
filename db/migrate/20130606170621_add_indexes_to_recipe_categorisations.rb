class AddIndexesToRecipeCategorisations < ActiveRecord::Migration
  def change
    add_index :recipe_items, :item_id
    add_index :recipe_items, :category_id
  end
end
