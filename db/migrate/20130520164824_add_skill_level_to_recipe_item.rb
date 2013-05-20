class AddSkillLevelToRecipeItem < ActiveRecord::Migration
  def change
    add_column :recipe_items, :skill_level, :string
  end
end
