class AddIndexesToRecipeCategory < ActiveRecord::Migration
  def change
    add_index :recipe_categories, :url
    add_index :recipe_categories, :order
  end
end
