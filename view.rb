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

  def list_recipes(recipes)
    puts "\n------------"
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}: #{recipe.description}"
    end
    puts "------------"
  end

end