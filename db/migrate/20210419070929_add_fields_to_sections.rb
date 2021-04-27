class AddFieldsToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :grader, :text # Student nameDotNumber that is grading that section
  end
end
