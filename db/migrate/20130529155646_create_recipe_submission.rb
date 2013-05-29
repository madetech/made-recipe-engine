class CreateRecipeSubmission < ActiveRecord::Migration
  def change
    create_table :recipe_submissions do |t|
      t.string    :first_name, :null => false
      t.string    :last_name, :null => false
      t.string    :city
      t.string    :email, :null => false
      t.string    :recipe_name, :null => false
      t.string    :video
      t.text      :description, :null => false
      t.integer   :prep_time, :null => false
      t.integer   :cook_time, :null => false
      t.integer   :serves, :null => false
      t.text      :ingredients, :null => false
      t.text      :method, :null => false
      t.string    :type

      t.timestamps
    end

    add_attachment  :recipe_submissions, :image
  end
end
