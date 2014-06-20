class TeachersImporter

  def initialize(filename=File.dirname(__FILE__) + "/../db/data/teachers.csv")
    @filename = filename
  end

  def import
    field_names = ['name', 'email', 'address', 'phone_number']

    print "Importing teachers from #{@filename}: "
    Teacher.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        student = Teacher.create!(attribute_hash)
        print "."; STDOUT.flush
      end
    end
    puts "\nDONE"
  end

end
