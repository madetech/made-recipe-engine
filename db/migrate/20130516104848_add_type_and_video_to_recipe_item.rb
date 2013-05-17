class AddTypeAndVideoToRecipeItem < ActiveRecord::Migration
  def change
    add_column :recipe_items, :type, :string
    add_column :recipe_items, :video, :text
  end
end
