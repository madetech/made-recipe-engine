class AddDescriptionToRecipeItem < ActiveRecord::Migration
  def change
    add_column :recipe_items, :description, :text
  end
end
