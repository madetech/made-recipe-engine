if Recipe.config.engine_routing
  Recipe::Engine.routes.draw do
    root                                       :to => 'recipe#index',                 :as => 'recipes'

    match '/:category',                        :to => 'recipe#recipe_by_category',    :as => 'recipe_category',          :via => [:get]
    match '/:category/:recipe',                :to => 'recipe#recipe_category_item',  :as => 'recipe_category_item',     :via => [:get]
    match '/:category/:recipe/shopping-list',  :to => 'recipe#recipe_shopping_list',  :as => 'recipe_shopping_list',     :via => [:get]
  end
end
