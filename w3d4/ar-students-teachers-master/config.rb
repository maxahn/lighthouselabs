require 'active_record'
require 'validates_email_format_of'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => "db/ar-students.sqlite3"
)

require_relative 'app/models/student'
require_relative 'app/models/teacher'
require_relative 'app/models/classroom'
# Note: add any other models / classes that need to be required here (eg: Teacher)
