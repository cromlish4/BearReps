
require 'dbi'

class Add_db

    def add_to_course_db(course_hash, sections_arr)
      db = DBI.connect("DBI:SQLite:development:localhost", 'myid', '')
      title = course_hash['course']['title']
      term = course_hash['course']['term']
      units = course_hash['course']['maxUnits']
      campus = course_hash['course']['campus']
      subject = course_hash['course']['subject']
      catalog_number = course_hash['course']['catalogNumber']
      db.do("INSERT INTO COURSES(title, term, units, campus, subject, catalog_number) VALUES (title, term, units, campus, subject, catalog_number)")
      db.commit

    end

     def add_to_people_db(hash)
       db = DBI.connect("DBI:SQLite:development:localhost", 'myid', '')

       db.do("INSERT INTO PEOPLE()")

       end
     end
