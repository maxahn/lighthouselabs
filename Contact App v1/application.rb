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
    puts " show     - Enter ID to show detail of a contact"
    puts " find     - Find contacts by name"
    puts " quit     - Exit Application"
    print "> "
  end

  # take user command and decide what to do
  def run_command(command)
    case command.downcase
    when 'new'
      new_contact
      run
    when 'list'
      list_contacts
      run
    when 'show'
      puts "Enter ID: "
      n = gets.chomp.to_i
      show_detail(n)
      run  
    when 'find'
      puts "Enter search term: "
      name = gets.chomp
      find_contact(name)
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

  # list all contacts
  def list_contacts
    
    length = Contact.all.length
    for n in 0...length
      puts "#{n}: (#{Contact.find(n)[0]}) "
    end
  end

  # show contact detail by ID
  def show_detail(n)
    puts "Here's the detail for contact ID #{n}"
    puts "Name: #{Contact.find(n)[0]}"
    puts "Email: #{Contact.find(n)[1]}"
  end

  # find contact by searching name
  def find_contact(input)
    # binding.pry
    matches = Contact.all.each_with_index.select { |name, index| name[0].to_s =~ /#{Regexp.quote(input)}/i }
    matches.map! {|match| match[1]}
    puts "Here's a list of contacts matching your search: "
    puts "================================"
    matches.each do |index|
      puts "Name: #{Contact.find(index)[0]}"
      puts "Email: #{Contact.find(index)[1]}"
      puts "================================"
    end
  end

end
