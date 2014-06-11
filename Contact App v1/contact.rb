class Contact

  ## In-memory list of contacts
  @@contacts = [["Alan Hsu", "alan@gmail.com"], ["BOB Kent", "bob@gmail.com"], ["Alan Keall", "kalan@gmail.com"]]

  attr_accessor :name
  attr_accessor :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end



  # def to_string(input)
  #   input.join(", ")
  # end



  ## Class Methods
  class << self

    def valid_email?(email)
      # does email exist?
      already_exist = []
      Contact.all.each do |one_contact|
        already_exist << (one_contact[1].to_s =~ /^#{Regexp.quote(email)}$/i)
      end
      already_exist = already_exist.any? {|i| i.is_a? Fixnum }
      
      # is it an email?
      if email !~ /@/
        puts "Not a valid email address! Please try again."
        false
      elsif already_exist 
        puts "Email address already exist! Please try again."
        false
      else
        true
      end
    end

    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts

      # Add new contact into @@contacts
      @@contacts << [name, email]

    end

    def find(index)
      @@contacts[index]
    end

    def all
      @@contacts
    end
  end

end
