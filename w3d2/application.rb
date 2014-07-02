class Application

  def run
    show_main_menu
    input = gets.chomp
    run_command(input)
  end

  private

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to Contacts APP, What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " show     - Enter ID to show detail of a contact"
    puts " find     - Find contacts by name"
    puts " add      - Add phone numbers"
    puts " save     - Save contact to CSV file"
    puts " quit     - Save & Exit Application"
    print "> "
  end

  # take user command and decide what to do
  def run_command(command)
    while run == true
      case command.downcase
      when 'new'
        new_contact
        run
      when 'list'
        list_contacts
        run
      when 'find'
        puts "Enter ID: "
        id = gets.chomp.to_i
        Contact.find(id)
        run  
      when 'find by first name'
        puts "Enter first name: "
        name = gets.chomp
        Contact.find_all_by_firstname(name)
        run
      when 'add'
        puts "Enter contact ID: "
        id = gets.chomp.to_i
        puts "Enter Label: "
        label = gets.chomp
        puts "Enter Phone Number: "
        number = gets.chomp
        Contact.add_phone(id, label, number)
        run
      when 'save'
        Contact.save
        run
      when 'quit'
        Contact.save
        puts "Goodbye"
      else 
        puts "unknown command"
        run
      end
    end
  end

  #create new contact
  def new_contact

    puts "Enter email address: "
    email = gets.chomp
    if Contact.valid_email?(email) == true
      puts "Enter full name: "
      name = gets.chomp
      Contact.create(name, email, {})
    else
      new_contact
    end
  end

  # list all contacts
  def list_contacts
    
    length = Contact.all.length
    for n in 0...length
      puts "#{n}: (#{Contact.find(n).name}) "
    end
  end

  # show contact detail by ID
  def show_detail(n)
    puts "Here's the detail for contact ID #{n}"
    puts "================================"
    puts "Name: #{Contact.find(n).name}"
    puts "Email: #{Contact.find(n).email}"
    puts Contact.find(n).phone_hash.to_yaml
    puts "================================"
  end

  # find contact by searching name
  def find_contact(input)
    # binding.pry
    index_result = []
    matches = Contact.all.each_with_index do |one_contact, index|
      if one_contact.name.to_s =~ /#{Regexp.quote(input)}/i 
              index_result << index
      end
    end
    puts "Here's a list of contacts matching your search: "
    puts "================================"
    index_result.each do |index|
      puts "Name: #{Contact.find(index).name}"
      puts "Email: #{Contact.find(index).email}"
      puts Contact.find(n).phone_hash.to_yaml
      puts "================================"
    end
  end

  def save_contact
    array = []

    length = Contact.all.length
    for n in 0...length
      array << [Contact.find(n).name, Contact.find(n).email, Contact.find(n).phone_hash]
    end

    CSV.open('./phonebook.csv', 'w') do |csv_object|
      array.each do |row_array|
        csv_object << row_array
      end
    end
  end
end
