

require 'sqlite3'


class Add_db < ApplicationRecord
  course = Course.ne
    def add_to_course_db(course_hash)
      db = SQLite3::Database.open("development.sqlite3")
      title = course_hash['course']['title']
      term = course_hash['course']['term']
      units = course_hash['course']['maxUnits']
      campus = course_hash['course']['campus']
      subject = course_hash['course']['subject']
      catalog_number = course_hash['course']['catalogNumber']
      #Course.find_or_create_by(title: title, term: term, units: units, campus: campus, subject: subject, catalogNumber: catalog_number)
      db.execute("INSERT INTO COURSES(title, term, units, campus, subject, catalog_number) VALUES (" + title + ", " + term + ", " + units + ", " + campus + ", " + subject + ", " + catalog_number + ")")
      # db.commit

    end

    #Commenting out for now. May need to implement this function here, depending
    #on login branch
     #def add_to_people_db(hash)
       #db = DBI.connect("DBI:SQLite:development:localhost", 'myid', '')

       #db.do("INSERT INTO PEOPLE()")

     #end


  def main
    db = SQLite3::Database.open("development.sqlite3")
    db.execute("INSERT INTO COURSES VALUES ('Web Applications', '1212', '4', 'col', 'CSE', '3901'")
    print db.closed?
    #course_hash = Hash.new("course")
    #course_hash_2 = Hash.new("course")
    #course_hash = {"title" => "Web Applications", "term" => "1214", "maxUnits" => "4", "campus" => "col", "subject" => "CSE", "catalogNumber" => "3901"}
    #course_hash_2 = {"title" => "Computer Networking", "term" => "1214", "maxUnits" => "3", "campus" => "col", "subject" => "CSE", "catalogNumber" => "3461"}
    #add_to_course_db course_hash
    #add_to_course_db course_hash_2
    #puts "Finished!"
  end
end
