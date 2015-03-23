class RecipesController < ApplicationController
  http_basic_authenticate_with name: "valeria", password: "teamomucho", except: [:index, :show]

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
 
  def new
    @recipe = Recipe.new
  end
 
  def edit
    @recipe = Recipe.find(params[:id])
  end
 
  def create
    @recipe = Recipe.new(recipe_params)
 
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end
 
  def update
    @recipe = Recipe.find(params[:id])
 
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end
 
  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy
 
    redirect_to recipes_path
  end
 
  private
    def recipe_params
      params.require(:recipe).permit(:category, :title, :ingredients, :text)
    end
end
