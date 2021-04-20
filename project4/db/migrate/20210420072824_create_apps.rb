class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.string :nameDotNumber
      t.string :email
      t.string :course
      t.string :comments
      t.string :approved, :default => "false" # If instructor approves of grader than set to true
      # So the hiring team can choose to hire the applicant
      # Subject to change just my idea MSC
      t.timestamps
    end
  end
end
