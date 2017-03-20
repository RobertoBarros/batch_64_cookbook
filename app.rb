require_relative 'recipe_controller'
require_relative 'cookbook'
require_relative 'router'

cookbook_file = 'recipe.csv'
cookbook = Cookbook.new(cookbook_file)
controller = RecipeController.new(cookbook)
router = Router.new(controller)

router.run