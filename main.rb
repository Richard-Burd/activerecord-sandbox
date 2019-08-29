require 'pry'
require 'active_record'

# This test should print out
puts "Welcome to the ActiveRecord Sandbox"

# This should run when the ActiveRecord gem is called on
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/students.sqlite"
)

# This will create a new database in a new "db" folder.
sql = <<-SQL
  CREATE TABLE IF NOT EXISTS students (
  id INTEGER PRIMARY KEY,
  name TEXT
  )
SQL

# This allows the above SQL statement to be read into ActiveRecord
ActiveRecord::Base.connection.execute(sql)

# Students can be created but not written to ActiveRecord
class Student < ActiveRecord::Base
end

# This will show the columns created in the database
puts Student.column_names

# This will create an entry and send it to the database
Student.create(name: 'Octavious')

# This will find a student with an id of 1
Student.find(1)

# This lets you search for a name
Student.find_by(name: 'Octavious')

#=> Test Suite
x = Student.create(name: 'Plagentine')
puts "I just created a student named #{x.name}!"
puts "#{x.name} has an ID number of #{x.id}"