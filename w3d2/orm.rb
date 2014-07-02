require 'pg'
require 'pry'
require_relative './author'

conn = PG.connect(
  dbname: 'adfa',
  port: 5432,
  user:,
  host:,
  password:
  )


  class Author
  attr_accessor :first_name, :last_name
  
  def initialize(first_name, last_name)

  end

  def self.connection= conn
    @@db = conn
  end

  # Return all authors in an array of hashes
  def self.all
    results = @@db.exec("SELECT * FROM authors")
    results.to_a
  end

  # Return an author by id
  def self.find(id)

  end

  # Create save the author and its parameters
  def save

  end

  # Remove this author from the database
  def destroy
    
  end
  
end
