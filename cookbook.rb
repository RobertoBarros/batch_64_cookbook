require 'csv'

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load
  end

  def add(recipe)
    @recipes << recipe
    save
  end

  def all
    @recipes
  end

  def remove(index)
    @recipes.delete_at(index)
    save
  end

  def find(index)
    @recipes[index]
  end

  def save
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.done?, recipe.difficulty, recipe.cook_time]
      end
    end
  end

  private

  def load
    CSV.foreach(@csv_file).each do |row|
      recipe = Recipe.new(row[0], row[1], row[3], row[4])
      recipe.mark_as_done! if row[2] == 'true'
      @recipes << recipe
    end
  end


end