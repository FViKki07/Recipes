class RecipesController < ApplicationController
  def create
    recipe = Recipe.create(recipe_params)  

    redirect_to recipe_path(recipe)
  end 
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)

    #redirect_to recipes_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipe_path
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :user)
  end
end
