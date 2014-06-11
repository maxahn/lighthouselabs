class Application

  def run
    show_main_menu
    input = gets.chomp
    run_command(input)
  end

  private

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " quit     - Exit Application"
    print "> "
  end

  # take user command and decide what to do
  def run_command(command)
    case command
    when 'new'
      new_contact
      run
    when 'list'
      run
    when 'quit'
      puts "Goodbye"
    else 
      puts "unknown command"
      run
    end
  end

  #create new contact
  def new_contact
    puts "Enter full name: "
    name = gets.chomp
    puts "Enter email address: "
    email = gets.chomp
    Contact.create(name, email)
  end

  #
  def list_contacts

    for n in 1...length
      puts n + ": (#{Contact.find(n)})"

end
