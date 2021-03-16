class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title 
      t.string :term 
      t.string :units 
      t.string :campus 
      t.string :subject 
      t.string :catalog_number 

      t.timestamps
    end
  end
end
