class Teacher < ActiveRecord::Base
  # implement your Student model here
  validates :email, uniqueness: true, :email_format => {:message => 'is not looking good'}
  has_many :classrooms
  has_many :students, :through => :classrooms


end
