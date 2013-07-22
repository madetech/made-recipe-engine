class AddLinkToIngredients < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :link, :string
  end
end
