require_relative "../config/environment.rb"

class Student

attr_accessor :id, :name, :grade

def initialize(id = nil, name, grade)
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
  sql = <<-SQL 
  DROP TABLE IF EXISTS students 
  SQL
   DB[:conn].execute(sql)
end 

def self.new_from_db(row)

def update 
  sql = "UPDATE students SET name = ?, grade = ?, WHERE ID = ?"
  DB[:conn].execute(sql,self.name,self.grade,self.id)
end 

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
