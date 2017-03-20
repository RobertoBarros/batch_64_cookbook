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

  private

  def load
    CSV.foreach(@csv_file).each do |row|
      recipe = Recipe.new(row[0], row[1])
      @recipes << recipe
    end
  end

  def save
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

end