class Application



  def run
    rerun = true
    while rerun == true
      show_main_menu
      input = gets.chomp
      rerun = run_command(input)
    end
    puts "Goodbye"
  end

  private

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to Contacts APP, What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " update   - Enter ID to update a contact"
    puts " show     - Enter ID to show detail of a contact"
    puts " find     - Find contacts by name"
    puts " save     - Save contact to CSV file"
    puts " quit     - Save & Exit Application"
    print "> "
  end

  # take user command and decide what to do
  def run_command(command)
    rerun = true
    while rerun == true
      case command.downcase

      when 'new'
        new_contact
        return true

      when 'list'
        list_contact
        return true

      when 'show'
        show_contact
        return true

      when 'find'
        puts "by: first name, last name, or email"
        choice = gets.chomp
        puts "Enter #{choice}: "
        input = gets.chomp
        case choice
        when 'first name'
          choice = :firstname
        when 'last name'
          choice = :lastname
        when 'email'
          choice = :email
        else
          puts "Do not compute!"
        end
        find_contact(choice, input)
        return true

      when 'update'
        puts "Enter contact ID to update: "
        id = gets.chomp.to_i

        if id_error_rescue(id) == false
          puts Contact.find(id).attributes
        end
        
        t = Contact.find(id)
        puts "You will edit the following contact:"
        puts t.firstname + " " + t.lastname
        
        puts "What would you like to update (first name, last name, email): "
        choice = gets.chomp

        puts "Enter new #{choice}: "
        input = gets.chomp
        case choice
        when 'first name'
          Contact.find(id).update(firstname: input)
        when 'last name'
          Contact.find(id).update(lastname: input)
        when 'email'
          Contact.find(id).update(email: input)
        else
          puts "do not compute!"
        end

        return true

      when 'save'
        save_contact
        return true

      when 'quit'
        return false

      else 
        puts "unknown command"
        return true
      end
    end
  end

  def id_error_rescue(id)
    begin  
      t = Contact.find(id)
    rescue ActiveRecord::RecordNotFound => e  
      puts e.message  
      puts "User ID is not yet assigned" 
      return true
    else
      return false
    end
  end

  def save_contact
    Contact.contacts_in_memory.each do |one_contact|
      one_contact.save
    end
  end

  def find_contact(choice, input)
    list = Contact.where(choice => input)
    ids = []
    names = []
    emails = []
    list.each do |x|
      ids << x.id
      names << x.firstname + " " + x.lastname
      emails << x.email
    end
    ids.each_with_index do |id, index|
      puts "ID: #{id} => #{names[index]}, #{emails[index]}"
    end
  end

  #create new contact
  def new_contact

    puts "Enter email address: "
    email = gets.chomp
    if Contact.valid_email?(email) == true
      puts "Enter first name: "
      first_name = gets.chomp
      puts "Enter last name: "
      last_name = gets.chomp
      Contact.contacts_in_memory << Contact.new(firstname: first_name, lastname: last_name, email: email)
    else
      new_contact
    end
  end

  def list_contact
    Contact.all.order(:id).each do |x|
      puts x.attributes
    end
  end

  def show_contact
    puts "Enter ID: "
    id = gets.chomp.to_i
    if id_error_rescue(id) == false
      puts Contact.find(id).attributes
    end
  end
  # list all contacts


  # show contact detail by ID


  # find contact by searching name

end
