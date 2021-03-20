class AddFieldsToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :units, :string
    add_column :courses, :campus, :string
    add_column :courses, :subject, :string
    add_column :courses, :catalog_number, :string
    
  end
end
