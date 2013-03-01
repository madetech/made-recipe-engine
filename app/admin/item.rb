# if defined?(ActiveAdmin)
#   ActiveAdmin.register Recipe::Item do

#     filter :name
#     filter :created_at

#     menu :label => 'Individual Recipe', :parent => "Recipes", :priority => 1

#     controller do
#       cache_sweeper Recipe.config.recipe_item_sweeper if Recipe.config.recipe_item_sweeper
#       defaults :finder => :find_by_url
#     end

#     form do |f|
#       f.inputs "Recipe" do
#         f.input     :name,
#                     :label => 'Recipe name'

#         f.input     :image,
#                     :hint => f.template.image_tag(f.object.image.url(:thumb))
#
#         f.input     :description
#       end

#       f.inputs "Recipe Ingredients"
#         f.has_many :ingredients do |f_ingredient|
#           f_ingredient.input  :quantity,
#                               :hint => 'eg. 10g'
#           f_ingredient.input  :name,
#                               :label => 'Ingredient'
#         end
#       end

#       f.inputs "Method" do
#         f.input     :method
#       end

#       f.inputs "Recipe Details" do
#         f.input     :prep_time,
#                     :label => 'Preperation Time',
#                     :hint => 'time in minutes'

#         f.input     :cook_time,
#                     :label => 'Cook Time',
#                     :hint => 'time in minutes'

#         f.input     :serves,
#                     :label => 'Servings',
#                     :hint => 'number of people the recipe feeds'

#         f.input     :order,
#                     :hint => 'display order'

#       end

#       f.buttons
#     end

#     index do
#       column :name
#       column :created_at
#       column :updated_at

#       default_actions
#     end

#   end
# end
