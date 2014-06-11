class Contact

  ## In-memory list of contacts
  @@contacts = [["Alan", "alan@gmail.com"], ["BOB", "bob@gmail.com"]]

  attr_accessor :name
  attr_accessor :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end



  def to_string(input)
    input.join(", ")
  end



  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
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
