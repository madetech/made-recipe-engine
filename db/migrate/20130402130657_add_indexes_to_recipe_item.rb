class AddIndexesToRecipeItem < ActiveRecord::Migration
  def change
    add_index :recipe_items, :favourite
    add_index :recipe_items, :name
    add_index :recipe_items, :url
    add_index :recipe_items, :order
  end
end
