class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.string :term, null: false
      t.string :units 
      t.string :campus 
      t.string :subject, default: 'CSE'
      t.string :catalog_number, null: false

      t.timestamps
    end
  end
end
