class AddFieldsToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :grader, :string # Student nameDotNumber that is grading that section
  end
end
