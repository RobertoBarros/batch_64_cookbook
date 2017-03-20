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

  def mark_as_done
    # Listar todas as receitas
    list_all_recipes

    # View pede o index
    index_of_recipe = @view.ask_recipe_index

    # Pede para o cookbook a receita com esse index
    recipe = @cookbook.find(index_of_recipe)

    # Marca ela como done
    recipe.mark_as_done!

    # Pedir para o cookbook salvar
    @cookbook.save
  end

  def import
    # View pede qual ingrediente da receita
    ingredient = @view.ask_recipe_ingredient

    # Parser pesquisa receitas com o ingrediente
    parser = Parser.new
    names = parser.search(ingredient)

    # View mostra as receitas que podem ser importadas
    @view.show_recipes_name(names)

    # View pede qual index da receita para importar
    index_of_recipe = @view.ask_recipe_index

    # Parser importa a receita
    recipe = parser.import(index_of_recipe)

    # Adiciona a receita no cookbook
    @cookbook.add(recipe)


  end

  private

  def list_all_recipes
    recipes = @cookbook.all
    @view.list_recipes(recipes)
  end

end