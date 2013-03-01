class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.string  :name
      t.string  :quantity
      t.integer :item_id

      t.timestamps
    end
  end
end
