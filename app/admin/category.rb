# if defined?(ActiveAdmin)
#   ActiveAdmin.register Recipe::Category do

#     filter :name
#     filter :created_at

#     menu :label => 'Categories', :parent => "Recipes", :priority => 2

#     controller do
#       cache_sweeper  Recipe.config.recipe_category_sweeper if Recipe.config.recipe_category_sweeper
#       defaults :finder => :find_by_url
#     end

#     form do |f|
#       f.inputs "Category" do
#         f.input     :name,
#                     :label => 'Recipe category name'

#         f.input     :image,
#                     :hint => f.template.image_tag(f.object.image.url(:thumb))

#         f.input     :text

#         f.input     :order
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
