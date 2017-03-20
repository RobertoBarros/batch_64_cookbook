class View
  def initialize
  end

  def ask_recipe_name
    puts "What's the name of recipe?"
    gets.chomp
  end

  def ask_recipe_description
    puts "What's the description of recipe?"
    gets.chomp
  end

  def ask_recipe_index
    puts "What's the index of recipe?"
    gets.chomp.to_i - 1
  end

  def ask_recipe_ingredient
    puts "What's the recipe ingredient to search?"
    gets.chomp
  end

  def show_recipes_name(names)
    names.each_with_index do |name, index|
      puts "#{index + 1} - #{name}"
    end
  end

  def list_recipes(recipes)
    puts "\n------------"
    recipes.each_with_index do |recipe, index|
      done = recipe.done? ? "[X]" : "[ ]"
      puts "#{done} #{index + 1} - #{recipe.name}"
      puts "Dificuldade: #{recipe.difficulty}"
      puts "Tempo: #{recipe.cook_time}"
      puts "Descrição: #{recipe.description}"
      puts "***************************************"

    end
    puts "------------"
  end

end