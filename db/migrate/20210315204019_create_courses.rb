class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.text :title, null: false
      t.text :term, null: false
      t.text :units, null: false
      t.text :campus
      t.text :subject, default: 'CSE'
      t.text :catalog_number, null: false

      t.timestamps
    end
  end
end
