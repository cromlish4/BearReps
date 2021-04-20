class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.string :nameDotNumber
      t.string :email
      t.string :course
      t.string :comments
      t.string :approved, :default => "false" # Changes with instructor Rec.
      t.timestamps
    end
  end
end
