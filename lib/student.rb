require_relative "../config/environment.rb"

class Student

attr_accessor :id, :name, :grade

def initialize(id = nil, name, grade)
  @id = id 
  @name = name 
  @grade = grade
end

def self.create_table
  sql = <<-SQL 
  CREATE TABLE IF NOT EXISTS students(id INTERGER PRIMARY KEY, name TEXT, grade TEXT)
  SQL
  DB[:conn].execute(sql)
end 

def self.drop_table 
  DB[:conn].execute("DROP TABLE IF EXISTS students")
end 
def self.create(name:,grade:)
  student = Student.new(name,grade)
  student.save 
  student
  end 

def self.new_from_db(row)
  id = row[0]
  name = row[1]
  grade = row[2]
  self.new(id,name,grade)
end 

def update 
  sql = "UPDATE students SET name = ?, grade = ?, WHERE ID = ?"
  DB[:conn].execute(sql,self.name,self.grade,self.id)
end 

def self.find_by_name(x)
  sql = <<-SQL
def save 
  if self.id 
    self.update 
  else 
  sql = <<-SQL 
  INSERT INTO students (name,grade)
  VALUES(?,?)
  SQL
DB[:conn].execute(sql,self.name,self.grade)
@id = DB[:conn].execute("SELECT last_insert_rowid() FROM students ")[0][0]
end 
end 
 
end 
