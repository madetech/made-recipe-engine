class CreateRecipeItems < ActiveRecord::Migration
  def change
    create_table :recipe_items do |t|
      t.string      :name
      t.string      :url
      t.text        :method
      t.integer     :order, :default => 9999
      t.integer     :prep_time
      t.integer     :cook_time
      t.integer     :serves

      t.timestamps
    end

    add_attachment :recipe_items, :image

  end
end
