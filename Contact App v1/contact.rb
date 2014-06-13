class Contact

  ## In-memory list of contacts
  @@contacts = []
  attr_accessor :name
  attr_accessor :email
  attr_accessor :phone_hash

  def initialize(name, email, phone_hash)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    @phone_hash = phone_hash
  end

  def store
    Contact.create(self.name, self.email, self.phone_hash)
  end

  def to_s
    puts "Name: #{Contact.name}"
    puts "Email: #{Contact.email}"
    puts Contact.phone_hash.to_yaml
  end



  ## Class Methods
  class << self

    def valid_email?(email)
      # does email exist?
      already_exist = []
      Contact.all.each do |one_contact|
        already_exist << (one_contact.email.to_s =~ /^#{Regexp.quote(email)}$/i)
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

    def create(name, email, phone_hash)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      @@contacts << Contact.new(name, email, phone_hash)
    end

    def add_phone(id, label, number)
      @@contacts[id].phone_hash[label.to_sym] = number
    end

    def find(index)
      @@contacts[index]
    end

    def all
      @@contacts
    end
  end

end
