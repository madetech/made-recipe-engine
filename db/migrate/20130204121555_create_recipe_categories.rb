class CreateRecipeCategories < ActiveRecord::Migration
  def change
    create_table :recipe_categories do |t|
      t.string      :name
      t.string      :url
      t.text        :text
      t.integer     :order, :default => 9999

      t.timestamps
    end

    add_attachment :recipe_categories, :image

  end
end
