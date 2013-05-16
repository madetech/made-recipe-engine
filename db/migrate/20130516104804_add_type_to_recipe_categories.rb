class AddTypeToRecipeCategories < ActiveRecord::Migration
  def change
    add_column :recipe_categories, :type, :string
  end
end
