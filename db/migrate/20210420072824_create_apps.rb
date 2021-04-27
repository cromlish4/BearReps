class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.text :nameDotNumber
      t.text :email
      t.text :course
      t.text :comments
      t.text :approved, :default => "false"
      t.text :employed_status, :default => "non_employed"
      t.text :assigned, :default => "unassigned"
      t.text :assigned_class, :default => "unassigned"
       # If instructor approves of grader than set to true
      # So the hiring team can choose to hire the applicant
      # Subject to change just my idea MSC
      t.timestamps
    end
  end
end
