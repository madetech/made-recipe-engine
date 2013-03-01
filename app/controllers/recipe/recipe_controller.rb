module Recipe
  class RecipeController < Recipe::ApplicationController
    require "duration"
    layout 'application'

    def index
      @categories = Category.with_recipes
    end

    def recipe_by_category
      @category = Category.find_by_url!(params[:category])
      @recipes = @category.items
    end

    def recipe_category_item
      @category = Category.find_by_url!(params[:category])
      @recipe = Item.find_by_url!(params[:recipe])

      raise ActiveRecord::RecordNotFound.new('Page not found') if !@recipe.in_category(params[:category])
      raise ActiveRecord::RecordNotFound.new('Page not found') if @recipe.blank?
    end

    def recipe_shopping_list
      @recipe = Item.find_by_url!(params[:recipe])
      @ingredients = @recipe.ingredients

      render 'recipe_shopping_list', :layout => 'base'
    end

  end
end
