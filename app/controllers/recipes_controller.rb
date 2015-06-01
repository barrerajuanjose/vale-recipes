class RecipesController < ApplicationController
  def index
    @sortBy = params[:sort_by]

    if !["category", "title"].include?(@sortBy)
      @sortBy = "category"
    end

  	@recipes = Recipe.all.order(@sortBy + " ASC")
  end
 
  def show
    @recipe = Recipe.find(params[:id])
  end
end
