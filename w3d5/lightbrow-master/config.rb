require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => "db/lightbrow.sqlite3"
)

# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.irregular 'history', 'histories'
# end

require_relative 'app/models/history'
