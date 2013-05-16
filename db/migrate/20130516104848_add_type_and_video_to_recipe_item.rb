class AddTypeAndVideoToRecipeItem < ActiveRecord::Migration
  def change
    add_column :recipe_item, :type, :string
    add_column :recipe_item, :video, :text
  end
end
