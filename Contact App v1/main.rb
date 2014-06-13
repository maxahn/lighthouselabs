require 'pry'
require 'yaml'
require 'active_support'
require 'csv'

require_relative 'contact'
require_relative 'application'

# a = Contact.new('Alan Hsu', 'alan@gmail.com', {mobile: '604-777-8888', home: '604-555-6666'})
# b = Contact.new('BOB Kent', "bob@gmail.com",{})
# c = Contact.new("Alan Keall", "kalan@gmail.com",{})

# test = [['Alan', 'email@email.com', "mobile: 604-333-4444, home: 503-444-3333"],['Don', 'don@gmeil.com', '']]

# a.store
# b.store
# c.store

## Load csv file.

# test = [["Alan", "email@email.com", {:mobile=>["504-444-5555", "343-323-5679"], :home=>["343-333-4444"]}]]
# test2 = ['Alan'], ["email@email.com"], [{:mobile=>"504-444-5555"}]

#     CSV.open('./test.csv', 'w') do |csv_object|
#       test.each do |row_array|
#         csv_object << row_array
#       end
#     end

# array[:sym] << "22"

CSV.foreach('./phonebook.csv') do |row_array|
  if row_array[2] == "{}"
    phone_hash = {}
  else
    phone_hash = row_array[2].gsub(/[{"}:]/,'').split(', ').map{|h| h1,h2 = h.split('=>'); {h1.to_sym => h2}}.reduce(:merge)
  end
  
  Contact.create(row_array[0], row_array[1], phone_hash)
end


Application.new.run
