require_relative 'parser'
require_relative 'view'
require_relative 'recipe'

class RecipeController
  def initialize(repository)
    @cookbook = repository
    @view = View.new
  end

  def list
    # Pegar todas as receitas armazenadas no repo (cookbook)
    # Pedir para a view mostrar essas receitas
    list_all_recipes
  end

  def create
    # View pede o nome e descricao da receita
    name = @view.ask_recipe_name
    description = @view.ask_recipe_description

    # Instancia uma nova receita
    recipe = Recipe.new(name, description)

    # Adiciona a receita ao cookbook
    @cookbook.add(recipe)
  end

  def destroy
    list_all_recipes
    # View pede o index da receita
    index_of_recipe = @view.ask_recipe_index
    # Pede para repo (cookbook) destruir a receita com o index
    @cookbook.remove(index_of_recipe)
  end

  private

  def list_all_recipes
    recipes = @cookbook.all
    @view.list_recipes(recipes)
  end

end