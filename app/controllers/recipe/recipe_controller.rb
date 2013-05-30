module Recipe
  class RecipeController < Recipe::ApplicationController
    require "duration"
    layout 'application'
    helper Recipe::ApplicationHelper::FormHelper


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

    def recipe_submit
      @submission = Recipe::Submission.new
    end

    def recipe_submission
      @submission = Recipe::Submission.new(params[:recipe_submission])

      if !@submission.save
        render :recipe_submission
      else
        redirect_to :action => :recipe_submission_thanks
      end
    end

    def recipe_submission_thanks
    end

  end
end
