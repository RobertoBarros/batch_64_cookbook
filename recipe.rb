class Recipe
  attr_reader :name, :description, :difficulty, :cook_time

  def initialize(name, description, difficulty = '0', cook_time = '-1')
    @name = name
    @description = description
    @difficulty = difficulty
    @cook_time = cook_time
    @done = false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end

end