class Router

  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    loop do
      print_actions
      action = gets.chomp.to_i
      dispatch(action)
      break unless @running
    end
  end

  private

  def print_actions
    puts "\n---"
    puts 'What do you want to do?'
    puts '1 - Display recipes'
    puts '2 - Add a new recipe'
    puts '3 - Remove a recipe'
    puts '4 - Mark recipe as done'
    puts '5 - Import a recipe'

    puts '6 - Stop'
    puts '---'
  end

  def dispatch(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.destroy
    when 4 then @controller.mark_as_done
    when 5 then @controller.import
    when 6 then @running = false
    else
      puts "Please type 1, 2, 3, 4, 5 or 6 :)"
    end
  end
end
