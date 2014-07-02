require 'pg'
 
class Contact

  ## In-memory list of contacts
  @@contacts = self.connection

  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :email


  def initialize(first_name, last_name, email)
    # TODO: assign local variables to instance variables
    @first_name = first_name
    @last_name = last_name
    @email = email
  end


  def save #insert/update database, need to know when to insert or update

  end

  def destroy #DELETE row

  end

## Class Methods
  class << self

    def connection
  # Establish a connection to the database (requires internet since it's on heroku!)
  # Note: You'll want to put in your own heroku creds
      puts "establishing connection ..."
      conn = PG.connect(
        dbname: 'd4jj8it2bc12h2',
        port: 5432,
        user: 'hesiyvogripjme',
        host: 'ec2-54-225-101-60.compute-1.amazonaws.com',
        password: 'YlUk4DZMUrJc9_1MO21C39vN7W'
      )
    end

    def valid_email?(email)
      # does email exist?
      already_exist = []
      Contact.emails.each do |x|
        already_exist << (x['email'] =~ /^#{Regexp.quote(email)}$/i)
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

    def find(id)

    end

    def find_all_by_lastname(name)

    end

    def find_all_by_firstname(name) 

    end

    def find_by_email(email)
      
    end

end

############################

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
