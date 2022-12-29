class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[update show destroy edit]

  def create
    @recipe = Recipe.create(recipe_params)  
    if @recipe.save
      redirect_to root_path, notice: "Рецепт добавлен"
      
    else
      flash.now[:alert] = 'Неправильно заполнили рецепты'
      render :new
    end
  end 
  
  def update
    @recipe.update(recipe_params)

    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy

    redirect_to root_path
  end

  def show
    @user = current_user
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :user_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
