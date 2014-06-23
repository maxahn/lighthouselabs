require 'pg'
 
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

 
# Output all author records from the authors table
# conn.exec("INSERT INTO authors (id, last_name, first_name) VALUES (4567, 'Andy', 'Harrison')")

keyword = "SELECT"

result = conn.exec( "#{keyword} email FROM contacts" )
already_exist = []
puts result.to_a

result = result.to_a
result.each do |x|
  already_exist << (x['email'] =~ /^#{Regexp.quote('andy@hotmail.com')}$/i)
end

puts already_exist

 
puts "Closing the db connection..."
conn.close
 
puts "DONE"